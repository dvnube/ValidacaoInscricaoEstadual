public class ValidadorIESP extends ValidadorIE implements IValidadorIE
{   
    private Map<Integer,Integer> pesos;
    private Integer posicaoD1;
    private Integer posicaoD2;
    private Boolean produtorRural;
    
    public override Boolean execute(String inscricaoEstadual)
    {
        produtorRural = inscricaoEstadual.left(1).toUpperCase().equals('P');
        if (produtorRural) //Inscrição estadual de produtor rural
        {
            tamanho = 12;
            tamanhoSemDigito = 8;
            posicaoD1 = 8;
        }
        else //Industriais e comerciantes (exceto produtores rurais a eles não equiparados)
        {
            tamanho = 12;
            tamanhoSemDigito = 8;
            posicaoD1 = 8;
            posicaoD2 = 11;
        }
        
        doisDigitos = false;
        this.inscricaoEstadual = inscricaoEstadual.replaceaLL('[^0-9]', '');  //apenas números
        modulo = 11;
        setPesos(new List<Integer>{1,3,4,5,6,7,8,10});
        
        return tamanhoValidado() ? execute() : false;         
    }
    
    public override Boolean execute()
    {  
        //Primeiro dígito
        digitoVerificadorInscricaoEstadual = inscricaoEstadual.substring(posicaoD1,posicaoD1+1);
        
        if (!produtorRural)
        {
            if (valida())
            {
                //Validou o primeiro, agora valida o segundo
                doisDigitos = true;
                pesoMinimo = 2;
                pesoMaximo = 10;
                tamanhoSemDigito = 11;
                digitoVerificadorInscricaoEstadual = inscricaoEstadual.substring(posicaoD2);
                
                return valida();                    
            }
            return false;
        }
        
        return valida();         
    }
    
    public override Integer getSoma()
    {
        if (doisDigitos)
        {
            return super.getSoma();
        }
        
        Integer soma = 0;        
        List<String> digitos = inscricaoEstadual.split('');
        
        for(Integer i = 0; i < tamanhoSemDigito ; i++)
        {
            Integer digito = Integer.valueOf(digitos.get(i));
            soma += digito * pesos.get(i);
        }
        
        return soma;
    }
    
    public override Integer calculaDigitoVerificador(Integer soma)
    {
        Integer resto = Math.mod(soma,modulo);
        
        return Integer.valueOf(String.valueOf(resto).right(1));
    }
    
    private void setPesos(List<Integer> pesosList)
    {   
        pesos = new Map<Integer,Integer>();
        Integer pos = 0;
        for (Integer peso : pesosList)
        {
            pesos.put(pos, peso);
            pos++;
        }
    }
    
}