public class Utils
{
    public static Map<String, Estado> nameToEstado
    {
        get
        {
            Map<String, Estado> estadoValues = new Map<String, Estado>();
            if (nameToEstado == null)
            {
                for (Estado enumValue : Estado.values())
                {
                    estadoValues.put(String.valueOf(enumValue).toUpperCase(), enumValue);
                }
            }
            return estadoValues;
        }
        private set;
    }
    
    public static Estado getEstado(String name)
    {        
        return String.isBlank(name) ? null : nameToEstado.get(name.toUpperCase());
    }
}