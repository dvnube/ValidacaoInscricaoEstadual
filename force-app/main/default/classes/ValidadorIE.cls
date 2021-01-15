public virtual class ValidadorIE 
{   
    public String inscricaoEstadual, digitoVerificadorInscricaoEstadual;
    public List<String> primeirosDigitos;
    public Integer tamanho, tamanhoSemDigito, pesoMinimo, pesoMaximo, digitoVerificador, modulo;
    protected Boolean doisDigitos;
    
    public ValidadorIE() { }
    
    public ValidadorIE(Integer tamanho, Integer tamanhoSemDigito, Integer pesoMinimo, Integer pesoMaximo, Boolean doisDigitos, List<String> primeirosDigitos)
    {
        this.tamanho = tamanho;
        this.tamanhoSemDigito = tamanhoSemDigito;
        this.pesoMinimo = pesoMinimo;
        this.pesoMaximo = pesoMaximo;
        this.doisDigitos = doisDigitos;
        this.primeirosDigitos = primeirosDigitos;
        modulo = 11; //padrão para a maioria dos estados
    }
    
    public ValidadorIE(Integer tamanho, Integer tamanhoSemDigito, Integer pesoMinimo, 
                       Integer pesoMaximo, Boolean doisDigitos, List<String> primeirosDigitos,
                       Integer modulo)
    {
        this.tamanho = tamanho;
        this.tamanhoSemDigito = tamanhoSemDigito;
        this.pesoMinimo = pesoMinimo;
        this.pesoMaximo = pesoMaximo;
        this.doisDigitos = doisDigitos;
        this.primeirosDigitos = primeirosDigitos;
        this.modulo = modulo;
    }
    
    public virtual Boolean execute(String inscricaoEstadual)
    {
        if (String.isNotBlank(inscricaoEstadual))
        {
            this.inscricaoEstadual = inscricaoEstadual.replaceaLL('[^0-9]', '');  //apenas números
            
            if (!tamanhoValidado() || !primeirosDigitosValidados())
            {
                return false;
            }
            return execute();
        }
        return false;  
    }
    
    public virtual Boolean execute()
    { 
        if (!doisDigitos)
        {
            digitoVerificadorInscricaoEstadual = inscricaoEstadual.right(1);
            return valida();
        }
        else
        {
            //Primeiro dígito
            digitoVerificadorInscricaoEstadual = inscricaoEstadual.substring(tamanhoSemDigito,tamanhoSemDigito+1);
            if (valida())
            {
                //Validou o primeiro, agora valida o segundo
                tamanhoSemDigito = tamanhoSemDigito + 1;
                doisDigitos = false;
                digitoVerificadorInscricaoEstadual = inscricaoEstadual.substring(tamanhoSemDigito, tamanho);
                return valida();                    
            }
            else
            {
                return false;
            }            
        }    
    }
    
    public virtual Boolean valida()
    {
        //Valida o dígito verificador
        digitoVerificador = calculaDigitoVerificador(getSoma());
        if (!digitoVerificadorInscricaoEstadual.equals(String.valueOf(digitoVerificador)))
        {
            return false;
        }        
        
        return true;
    }  
    
    public virtual Integer getSoma()
    {
        Integer peso = pesoMinimo;
        Integer soma = 0;
        
        List<String> digitos = inscricaoEstadual.split('');
        
        for(Integer i = (tamanhoSemDigito - 1); i >= 0 ; i--)
        {
            Integer digito = Integer.valueOf(digitos.get(i));
            soma += digito * peso;
            peso = (peso == pesoMaximo) ? pesoMinimo : peso + 1;
        }
        return soma;
    }
    
    public virtual Boolean tamanhoValidado()
    {
        if (inscricaoEstadual.length() != tamanho)
        {
            return false;
        }
        
        return true;
    }
    
    public virtual Boolean primeirosDigitosValidados()
    {
        //Inscrição estadual geralmente começa com dígitos predefinidos
        //Caso não possua nenhuma predefinição (como é o caso do RJ), nem valida
        if (primeirosDigitos.size() > 0)
        {
            String inscricaoEstadualPrimeirosDigitos = inscricaoEstadual.substring(0,2);
            for (String s : primeirosDigitos)
            {
                if (inscricaoEstadualPrimeirosDigitos.equals(s))
                {
                    //Primeiros dígitos válido
                    return true;
                }                
            }
            //Primeiros dígitos inválido
            return false;
        }
        
        //Primeiros dígitos válido
        return true;
    }
    
    public virtual Integer calculaDigitoVerificador(Integer soma)
    {
        Integer resto = (Math.mod(soma,modulo));
        
        return (resto <= 1) ? 0 : (modulo - resto);
    }
    
    public class ValidadorException extends Exception {}
}