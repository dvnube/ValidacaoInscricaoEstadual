public with sharing class ValidadorController 
{
    
    @AuraEnabled
    public static List<String> getEstados()
    {
        List<String> estados = new List<String>();

        for (Estado e : Estado.values())
        {
            estados.add(String.valueOf(e));
        }

        return estados;
    }

    @AuraEnabled(cacheable=true)
    public static Boolean check(String estado, String inscricaoEstadual)
    {
        try
        {
            return ValidadorIEFactory.newInstance(Utils.getEstado(estado)).execute(inscricaoEstadual);
        }
        catch (Exception e)
        {
            
            throw new AuraHandledException(e.getMessage());
        }        
    }

}
