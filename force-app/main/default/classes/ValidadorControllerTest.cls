@isTest
public class ValidadorControllerTest 
{
    @isTest
    public static void testGetEstados()
    {
        List<String> estados = new List<String>();

        for (Estado e : Estado.values())
        {
            estados.add(String.valueOf(e));
        }

        Test.startTest();
        List<String> estadosTest = ValidadorController.getEstados();
        Test.stopTest();

        for (String estado : estados)
        {
            System.assert(estadosTest.contains(estado), 'O estado ' + estado + ' não foi encontrado pela função getEstados()');
        }
    }

    @isTest
    public static void testCheck()
    {
        String estado = Estado.AC.name();
        String inscEst = '0127527276330';

        Test.startTest();
        Boolean check = ValidadorController.check(estado, inscEst);
        Test.stopTest();

        System.assert(check, 'Deveria ter funcionado pois a inscrição estadual [' + inscEst + '] do estado [' + estado + '] é válida');
    }

    @isTest
    public static void testCheckNull()
    {
        Boolean error = false;

        Test.startTest();
        try 
        {
            Boolean check = ValidadorController.check(null, null);    
        } 
        catch (Exception e) 
        {
            error = true;
        }        
        Test.stopTest();

        System.assert(error, 'Deveria ter dado erro, pois os parâmetros NULL não são tratados');
    }
}
