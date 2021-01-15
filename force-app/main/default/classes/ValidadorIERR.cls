public class ValidadorIERR extends ValidadorIE implements IValidadorIE
{  
    public ValidadorIERR()
    {
        super(9, 8, 0, 0, false, new List<String>{'24'}, 9);
    }
    
    public override Boolean valida()
    { 
        //Valida o dígito verificador
        digitoVerificador = calculaDigitoVerificador(getSoma()); 
        if (!digitoVerificadorInscricaoEstadual.equals(String.valueOf(digitoVerificador)))
        {
            return false;
        }        
        
        return true;
    }  
    
    public override Integer getSoma()
    {
        Integer soma = 0;
        //Cálculo do dígito verificador
        
        List<String> digitos = inscricaoEstadual.split('');
        
        for(Integer i = 0; i < tamanhoSemDigito ; i++)
        {
            Integer digito = Integer.valueOf(digitos.get(i));
            soma += digito * (i+1);
        }
        
        return soma;
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        return Math.mod(soma,modulo);
    }
}