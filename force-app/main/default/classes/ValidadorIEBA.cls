public class ValidadorIEBA extends ValidadorIE implements IValidadorIE
{    
    private Boolean inscricaoEstadual2DV; //Booleano para controlar lógica de dígito verificador
    public static FINAL Map<String,Integer> mapModulo = 
        new Map<String, Integer> {
            '0' => 10,
                '1' => 10,
                '2' => 10,
                '3' => 10,
                '4' => 10,
                '5' => 10,
                '6' => 11,
                '7' => 11,
                '8' => 10,
                '9' => 11                
                };                    
                    
    
    public ValidadorIEBA()
    {
        super(8, 6, 2, 7, true, new List<String>());
        inscricaoEstadual2DV = true;
    }
    
    public override Boolean execute(String inscricaoEstadual)
    {
        if (String.isNotBlank(inscricaoEstadual) && inscricaoEstadual.length() == 9)
        {
            tamanho = 9;
            tamanhoSemDigito = 7;     
            pesoMaximo = 8;
            inscricaoEstadual2DV = false;
        }
        
        this.inscricaoEstadual = inscricaoEstadual.replaceaLL('[^0-9]', '');  //apenas números
        
        return !tamanhoValidado() ? false : execute();         
    }
    
    public override Boolean execute()
    { 
        //Calcula, primeiramente, o SEGUNDO dígito verificador
        digitoVerificadorInscricaoEstadual = inscricaoEstadual.right(1);
        if (valida())
        {
            inscricaoEstadual2DV = false;
            //Após calcular o SEGUNDO dv, calcula o PRIMEIRO dv
            digitoVerificadorInscricaoEstadual = inscricaoEstadual.right(2).substring(0,1);
            inscricaoEstadual = inscricaoEstadual.substring(0,tamanhoSemDigito) + inscricaoEstadual.right(1); //Concatena a IE com o SEGUNDO dv, para calcular o PRIMEIRO dv
            tamanhoSemDigito++;
            pesoMaximo++;
            
            return valida();                    
        }
        else
        {
            return false;
        }  
    }
    
    public override Boolean valida()
    {
        //Valida o dígito verificador
        if (!digitoVerificadorInscricaoEstadual.equals(String.valueOf(calculaDigitoVerificador(getSoma()))))
        {
            return false;
        }        
        
        return true;
    }
    
    public override Integer getSoma()
    {
        Integer soma = 0;
        Integer peso = pesoMinimo;
        
        List<String> digitos = inscricaoEstadual.split('');
        
        //Cálculo do dígito verificador        
        for(Integer i = (tamanhoSemDigito - 1); i >= 0 ; i--)
        {
            Integer digito = Integer.valueOf(digitos.get(i));
            soma += digito * peso;
            peso = (peso == pesoMaximo) ? pesoMinimo : peso + 1;
        }
        
        return soma;
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {   
        Integer modulo = tamanho == 8 ? mapModulo.get(inscricaoEstadual.left(1)) : mapModulo.get(inscricaoEstadual.left(2).substring(1));
        Integer resto = Math.mod(soma,modulo);
        Integer limite = (modulo == 10) ? 0 : 1;
        
        return resto <= limite ? 0 : (modulo - resto);
    }
    
}