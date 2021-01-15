public class ValidadorIEGO extends ValidadorIE implements IValidadorIE
{
    public ValidadorIEGO()
    {
        super(9, 8, 2, 9, false, new List<String>{'10','11','15'});
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        if (inscricaoEstadual.equals('110944020'))
        {
            return 0;
        }
        else if (inscricaoEstadual.equals('110944021'))
        {
            return 1;
        }
        else if (Math.mod(soma,modulo) == 0)
        {
            return 0;
        }
        else if (Math.mod(soma,modulo) == 1)
        {
            Integer inscricaoEstadualNumber = Integer.valueOf(inscricaoEstadual.substring(0,inscricaoEstadual.length()-1));
            if (inscricaoEstadualNumber >= 10103105 && inscricaoEstadualNumber <= 10119997)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
            
        return modulo-Math.mod(soma,modulo);        
    }
}