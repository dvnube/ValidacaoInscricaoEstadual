public class ValidadorIEAM extends ValidadorIE implements IValidadorIE
{  
    public ValidadorIEAM()
    {
        super(9, 8, 2, 9, false, new List<String>());
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        return soma < modulo ? (modulo-soma) : Math.mod(soma,modulo) <= 1 ? 0 : modulo - Math.mod(soma,modulo);
    }
}