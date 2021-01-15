public class ValidadorIEFactory 
{
    public static FINAL Map<Estado,Type> validadorClass = 
        new Map<Estado, Type> {             
            Estado.AC => ValidadorIEAC.class,
                Estado.AL => ValidadorIEAL.class,
                Estado.AP => ValidadorIEAP.class,
                Estado.AM => ValidadorIEAM.class,
                Estado.BA => ValidadorIEBA.class,
                Estado.CE => ValidadorIECE.class,
                Estado.DF => ValidadorIEDF.class,
                Estado.ES => ValidadorIEES.class,
                Estado.GO => ValidadorIEGO.class,
                Estado.MA => ValidadorIEMA.class,
                Estado.MT => ValidadorIEMT.class,
                Estado.MS => ValidadorIEMS.class,
                Estado.MG => ValidadorIEMG.class,
                Estado.PA => ValidadorIEPA.class,  
                Estado.PR => ValidadorIEPR.class,                   
                Estado.PE => ValidadorIEPE.class,  
                Estado.PB => ValidadorIEPB.class,  
                Estado.PI => ValidadorIEPI.class,
                Estado.RJ => ValidadorIERJ.class,
                Estado.RN => ValidadorIERN.class,
                Estado.RS => ValidadorIERS.class,
                Estado.RO => ValidadorIERO.class,
                Estado.RR => ValidadorIERR.class,
                Estado.SC => ValidadorIESC.class,
                Estado.SP => ValidadorIESP.class,
                Estado.SE => ValidadorIESE.class,
                Estado.TO => ValidadorIETO.class
                };
                    
    public static IValidadorIE newInstance(Estado e)
    {
        return (IValidadorIE)validadorClass.get(e).newInstance();
    }

}