public class ValidadorIERN extends ValidadorIE implements IValidadorIE
{  
    public ValidadorIERN()
    {
        super(10, 9, 2, 10, false, new List<String>{'20'});
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        if (String.isNotBlank(inscricaoEstadual) && inscricaoEstadual.length() == 9)
        {
            tamanho = 9;
            tamanhoSemDigito = 8;
            pesoMaximo = 9;               
        }
        
        return super.execute(inscricaoEstadual);         
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        soma *= 10;
        Integer resto = Math.mod(soma,modulo);
        return (resto == 10) ? 0 : resto;
    }
}