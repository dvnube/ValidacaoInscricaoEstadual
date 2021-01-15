public class ValidadorIEAP extends ValidadorIE implements IValidadorIE
{  
    //Se a inscrição estadual estiver nesse range
    // p = 5 
    // d = 0
    private FINAL Integer pd1Minimo = 3000001;
    private FINAL Integer pd1Maximo = 3017000;
    
    //Se a inscrição estadual estiver nesse range
    // p = 9 
    // d = 1
    private FINAL Integer pd2Minimo = 3017001;
    private FINAL Integer pd2Maximo = 3019022;
    
    //Se a inscrição estadual estiver nesse range
    // p = 0 
    // d = 0
    private FINAL Integer pd3Minimo = 3019023;
    
    Integer inscricaoEstadualNumber;
    Integer p;
    Integer d;
    public ValidadorIEAP()
    {
        super(9, 8, 2, 9, false, new List<String>{'03'});        
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        try
        {
        	inscricaoEstadualNumber = Integer.valueOf(inscricaoEstadual.substring(0,inscricaoEstadual.length()-1));
        }
        catch (Exception e)
        {
            throw new ValidadorException(Label.InscricaoEstadualAPIncorreta + '' + inscricaoEstadual);
        }
        return super.execute(inscricaoEstadual);
    }
    
    private void setPD()
    {
        
        try
        {
            if (inscricaoEstadualNumber >= pd1Minimo && inscricaoEstadualNumber <= pd1Maximo)
            {
                p = 5;
                d = 0;
            }
            else if (inscricaoEstadualNumber >= pd2Minimo && inscricaoEstadualNumber <= pd2Maximo)
            {
                p = 9;
                d = 1;
            }
            else if (inscricaoEstadualNumber >= pd3Minimo)
            {
                p = 0;
                d = 0;
            }
            else
            {
                throw new ValidadorException(Label.InscricaoEstadualAPInvalida + '' + inscricaoEstadualNumber);
            }
        }
        catch (ValidadorException ve)
        {
            throw new ValidadorException(ve.getMessage());
        }        
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        setPD();
        soma += p;
        Integer diferenca = modulo - Math.mod(soma,modulo);        
        
        return (diferenca == 10) ? 0 : (diferenca == modulo) ? d : diferenca;
    }
    
}