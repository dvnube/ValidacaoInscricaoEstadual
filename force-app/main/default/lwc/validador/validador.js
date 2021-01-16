import { LightningElement, api } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getEstados from "@salesforce/apex/ValidadorController.getEstados";
import check from "@salesforce/apex/ValidadorController.check";
import FORM_FACTOR from "@salesforce/client/formFactor";

export default class Validador extends LightningElement {
  @api icon = "utility:einstein";
  @api title = "Validador de Inscrição Estadual";

  estados = [];
  values = {};
  valueEstado = "";
  valueInscEst = "";
  valid;
  loading = false;

  approval = {
    iconNameApproval: "",
    alternativeTextApproval: "",
    titleApproval: ""
  };

  get gridClassFormFactor() {
    if (FORM_FACTOR === "Small" || FORM_FACTOR === "Medium") {
      return "grid mobile";
    } else {
      return "grid desktop";
    }
  }

  get iconNameApproval() {
    return this.approval.iconNameApproval;
  }
  set iconNameApproval(value) {
    this.approval.iconNameApproval = value;
  }

  get alternativeTextApproval() {
    return this.approval.alternativeTextApproval;
  }
  set alternativeTextApproval(value) {
    this.approval.alternativeTextApproval = value;
  }

  get titleApproval() {
    return this.approval.titleApproval;
  }
  set titleApproval(value) {
    this.approval.titleApproval = value;
  }

  connectedCallback() {
    this.loadEstados();
  }

  loadEstados() {
    getEstados()
      .then((result) => {
        var estadosTemp = [];
        for (let key in result) {
          if (result.hasOwnProperty(key)) {
            estadosTemp = [
              ...estadosTemp,
              { value: result[key], label: result[key] }
            ];
          }
        }
        this.estados = estadosTemp;
      })
      .catch((error) => {
        this.showToast(
          "Erro",
          "Erro ao carregar estados: " + JSON.stringify(error.message),
          "error"
        );
      });
  }

  handleClick(event) {
    if (this.checkFields()) {
      this.loading = true;
      check({
        estado: this.values.valueEstado,
        inscricaoEstadual: this.values.valueInscEst
      })
        .then((result) => {
          this.handleApproval(result);
          this.loading = false;
        })
        .catch((error) => {
          this.showToast(
            "Erro",
            "Erro ao validar: " + JSON.stringify(error.body.message),
            "error"
          );

          this.setApproval("action:close", "Reprovado", "Reprovado");
          this.loading = false;
        });
    }
  }

  handleApproval(result) {
    if (result) {
      this.setApproval("action:approval", "Aprovado", "Aprovado");
    } else {
      this.setApproval("action:close", "Reprovado", "Reprovado");
    }
  }

  setApproval(iconNameApproval, alternativeTextApproval, titleApproval) {
    this.iconNameApproval = iconNameApproval;
    this.alternativeTextApproval = alternativeTextApproval;
    this.titleApproval = titleApproval;
  }

  checkFields() {
    const allValid = [
      ...this.template.querySelectorAll(".custom-required")
    ].reduce((validSoFar, inputCmp) => {
      inputCmp.reportValidity();
      return validSoFar && inputCmp.checkValidity();
    }, true);

    return allValid;
  }

  msg1 = "";

  handleChangeInput(event) {
    let dataset = event.currentTarget.dataset;
    let attributeName = dataset.attributename;

    this.values[attributeName] = event.target.value;
  }

  showToast(title, msg, variant) {
    this.dispatchEvent(
      new ShowToastEvent({
        title: title,
        message: msg,
        variant: variant
      })
    );
  }
}
