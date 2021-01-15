public class ValidadorIEMG extends ValidadorIE implements IValidadorIE
{    
    String inscricaoEstadualAuxiliar;
    
    public ValidadorIEMG()
    {
        super(14, 12, 1, 2, true, new List<String>());
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        this.inscricaoEstadual = inscricaoEstadual.replaceaLL('[^0-9]', '');  //apenas números
        //Adiciona um 0 após o código do município
        inscricaoEstadualAuxiliar = inscricaoEstadual.left(3) + '0' + inscricaoEstadual.substring(3);
        
        return tamanhoValidado() ? execute() : false;          
    }
    
    public override Boolean execute()
    { 
        //Primeiro dígito
        digitoVerificadorInscricaoEstadual = inscricaoEstadualAuxiliar.substring(tamanhoSemDigito,tamanhoSemDigito+1);
        if (valida())
        {
            //Validou o primeiro, agora valida o segundo            
            tamanho--;
            doisDigitos = false;            
            digitoVerificadorInscricaoEstadual = inscricaoEstadual.substring(tamanhoSemDigito, tamanho);
            pesoMinimo = 2;
            pesoMaximo = 11;
            
            return valida2();                  
        }
        
        return false;
    }
    
    private Boolean valida2()
    {    
        //Valida o dígito verificador
        digitoVerificador = super.calculaDigitoVerificador(super.getSoma()); 
        
        if (!digitoVerificadorInscricaoEstadual.equals(String.valueOf(digitoVerificador)))
        {
            return false;
        }        
        
        return true;
    }
    
    public override Integer getSoma()
    {
        Integer peso = pesoMinimo;
        String fatores = '';
        
        List<String> digitos = inscricaoEstadualAuxiliar.split('');
        
        for(Integer i = 0; i < tamanhoSemDigito ; i++)
        {
            Integer digito = Integer.valueOf(digitos.get(i));
            fatores += (String.valueOf(digito * peso));
            peso = (peso == pesoMinimo) ? pesoMaximo : pesoMinimo;
        }
        
        return getSoma(fatores);
    }
    
    private Integer getSoma(String fatores)
    {
        Integer soma = 0;
        for (String fator : fatores.split(''))
        {
            soma += Integer.valueOf(fator);                        
        }
        return soma;
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {        
        return getProximaDezena(soma) - soma;
    }
    
    public Integer getProximaDezena(Integer numero)
    {
        numero += 10;
        if (Math.mod(numero,10) != 0)
        {
            Integer resto;
            
            while (resto == null || resto != 0)
            {
                numero--;
                resto = Math.mod(numero, 10);
            }
        }
            
        return numero;
    }
    
    public override Boolean tamanhoValidado()
    {
        if (inscricaoEstadualAuxiliar.length() != tamanho)
        {
            return false;
        }
        
        return true;
    }
}