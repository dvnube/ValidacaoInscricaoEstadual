public class ValidadorIERO extends ValidadorIE implements IValidadorIE
{  
    public ValidadorIERO()
    {
        super(14, 13, 2, 9, false, new List<String>());
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        if (String.isNotBlank(inscricaoEstadual) && inscricaoEstadual.length() != 14) //antes de 01/08/2000
        {
            inscricaoEstadual = inscricaoEstadual.substring(3,inscricaoEstadual.length()); //3 primeiros dígitos são do município e não entram no cálculo
            tamanho = 6;
            tamanhoSemDigito = 5;
            pesoMaximo = 6;
        }

        return super.execute(inscricaoEstadual);         
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        Integer dv = modulo - Math.mod(soma,modulo);
        return (dv >= 10) ? (dv-10) : dv;
    }
}