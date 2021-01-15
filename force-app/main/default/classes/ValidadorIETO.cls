public class ValidadorIETO extends ValidadorIE implements IValidadorIE
{
    String inscricaoEstadualAux;
    
    public ValidadorIETO()
    {
        super(11, 10, 2, 9, false, new List<String>{'01', '02', '03', '99'});
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        if (String.isNotBlank(inscricaoEstadual))
        {
            inscricaoEstadualAux = inscricaoEstadual;
            inscricaoEstadual = inscricaoEstadual.left(2) + inscricaoEstadual.substring(4);
            tamanho = 9;
            tamanhoSemDigito = 8;         
        }
        
        return super.execute(inscricaoEstadual);         
    }
    
    public override Boolean primeirosDigitosValidados()
    { 
        String inscricaoEstadualPrimeirosDigitos = inscricaoEstadualAux.substring(2,4);
        
        for (String s : primeirosDigitos)
        {
            if (inscricaoEstadualPrimeirosDigitos.equals(s))
            {
                //Primeiros dígitos válido
                return true;
            }                
        }
        //Primeiros dígitos inválido
        return false;
    }
    
}