public class ValidadorIEAL extends ValidadorIE implements IValidadorIE
{  
    public ValidadorIEAL()
    {
        super(9, 8, 2, 9, false, new List<String>{'24'});
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        Integer resto = soma*10 - (((soma*10)/11)*11);
        return resto == 10 ? 0 : resto;
    }
}