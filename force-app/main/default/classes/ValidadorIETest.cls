@isTest
public class ValidadorIETest 
{

    static Map<Estado, String> mapEstadoIECerto = 
        new Map<Estado, String>
        {
            Estado.AC => '0127527276330',
            Estado.AL => '248322923',
            Estado.AP => '031629253',
            Estado.AM => '997387041',
            Estado.BA => '35798044',
            Estado.CE => '686250567',
            Estado.DF => '0711575300183',
            Estado.ES => '187190135',
            Estado.GO => '110944020',
            Estado.MA => '120835851',
            Estado.MT => '28020043414',
            Estado.MS => '286509490',
            Estado.MG => '3333178190828',
            Estado.PA => '158734181',
            Estado.PB => '239619790',
            Estado.PR => '6646458232',
            Estado.PE => '667748377',
            Estado.PI => '988874741',
            Estado.RJ => '91637235',
            Estado.RN => '201855038',
            Estado.RS => '4247556761',
            Estado.RO => '05753815376424',
            Estado.RR => '243677993',
            Estado.SP => '022991612531',
            Estado.SC => '960262024',
            Estado.SE => '293255571',
            Estado.TO => '13030857165'
        };
    
    @isTest
    public static void validadorIECerto()
    {   
        Map<Estado, Boolean> mapEstadoValidacao = new Map<Estado, Boolean>();

        Test.startTest();
        for (Estado e : mapEstadoIECerto.keySet())
        {
            mapEstadoValidacao.put(e, ValidadorIEFactory.newInstance(e).execute(mapEstadoIECerto.get(e)));
        }
        Test.stopTest();
        
        for (Estado e : mapEstadoValidacao.keySet())
        {
            System.assertEquals(true, mapEstadoValidacao.get(e), 'A validação deveria ser TRUE, pois a inscrição estadual [' + mapEstadoIECerto.get(e) + '] para o estado ' + e.name() + ' está correta.');
        }
    }
    
    @isTest
    public static void validadorIEACErrado()
    {
        Estado e = Estado.AC;
        String inscricaoEstadualInvalida = '0252098707271';
        Boolean validacao = false;

        Test.startTest();
        validacao = ValidadorIEFactory.newInstance(e).execute(inscricaoEstadualInvalida);
        Test.stopTest();
        
        System.assertEquals(false, validacao, 'Deveria ter dado ERRO, pois a inscrição estadual [' + inscricaoEstadualInvalida + '] para o estado ' + e.name() + ' está incorreta.');
    } 
    
    @isTest
    public static void validadorIEAPErrado()
    {
        Estado e = Estado.AP;
        String inscricaoEstadualInvalida = 'Inscrição Estadual AP Incorreta';
        Boolean erro = false;

        Test.startTest();
        try
        {
            erro = ValidadorIEFactory.newInstance(e).execute(inscricaoEstadualInvalida);
        }
        catch (Exception ex)
        {
            erro = ex.getMessage().contains(Label.InscricaoEstadualAPIncorreta);
        }
        Test.stopTest();
        
        System.assertEquals(true, erro, 'Deveria ter dado ERRO, pois a inscrição estadual [' + inscricaoEstadualInvalida + '] para o estado ' + e.name() + ' está incorreta.');
    } 
    
    @isTest
    public static void validadorIEAP2()
    {
        Estado e = Estado.AP;
        String inscricaoEstadualInvalida = '030000000';
        Boolean erro = false;

        Test.startTest();
        try
        {
            erro = ValidadorIEFactory.newInstance(e).execute(inscricaoEstadualInvalida);
        }
        catch (Exception ex)
        {
            erro = ex.getMessage().contains(Label.InscricaoEstadualAPInvalida);
        }
        Test.stopTest();
        
        System.assertEquals(true, erro, 'Deveria ter dado ERRO, pois a inscrição estadual [' + inscricaoEstadualInvalida + '] para o estado ' + e.name() + ' está incorreta.');
    }
    
    
    @isTest
    public static void validadorIEAP3()
    {
        Estado e = Estado.AP;
        String inscricaoEstadual = '030000012';
        Boolean validacao = false;

        Test.startTest();
        validacao = ValidadorIEFactory.newInstance(e).execute(inscricaoEstadual);
        Test.stopTest();
        
        System.assertEquals(true, validacao, 'A validação deveria ser TRUE, pois a inscrição estadual [' + inscricaoEstadual + '] para o estado ' + e.name() + ' está correta.');
    }
    
    @isTest
    public static void validadorIEAP4()
    {
        Estado e = Estado.AP;
        String inscricaoEstadual = '030170011';
        Boolean validacao = false;

        Test.startTest();
        validacao = ValidadorIEFactory.newInstance(e).execute(inscricaoEstadual);
        Test.stopTest();
        
        System.assertEquals(true, validacao, 'A validação deveria ser TRUE, pois a inscrição estadual [' + inscricaoEstadual + '] para o estado ' + e.name() + ' está correta.');
    }
    
    @isTest
    public static void validadorIEGO()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.GO;
        List<String> ies = new List<String>();
        ies.add('110944021');
        ies.add('101031051');
        ies.add('109480589');
        ies.add('100000100');
        ies.add('100000010');

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
        
        for (String ie : ies)
        {
            System.assertEquals(true, mapIEValidacao.get(ie), 'A validação deveria ser TRUE, pois a inscrição estadual [' + ie + '] para o estado ' + e.name() + ' está correta.');
        }
    }

    @isTest
    public static void validadorIEBA()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.BA;
        List<String> ies = new List<String>();
        ies.add('22457857'); //8D MOD 10
        ies.add('22457856'); //2D Errado
        ies.add('61234557'); //8D MOD 11
        ies.add('100000306'); //9D MOD 10

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
            
        System.assertEquals(true, mapIEValidacao.get('22457857'), 'A validação deveria ser TRUE, pois a inscrição estadual [22457857] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(false, mapIEValidacao.get('22457856'), 'A validação deveria ser FALSE, pois a inscrição estadual [22457856] para o estado ' + e.name() + ' está errada.');
        System.assertEquals(true, mapIEValidacao.get('61234557'), 'A validação deveria ser TRUE, pois a inscrição estadual [61234557] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(true, mapIEValidacao.get('100000306'), 'A validação deveria ser TRUE, pois a inscrição estadual [100000306] para o estado ' + e.name() + ' está correta.');
    }

    @isTest
    public static void validadorIEMG()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.MG;
        List<String> ies = new List<String>();
        ies.add('6461333187412'); //Certo
        ies.add('6461333187422'); //1DV Errado
        ies.add('6461333187413'); //2DV Errado
        ies.add('64613331874130'); //Tamanho Errado

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
            
        System.assertEquals(true, mapIEValidacao.get('6461333187412'), 'A validação deveria ser TRUE, pois a inscrição estadual [6461333187412] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(false, mapIEValidacao.get('6461333187422'), 'A validação deveria ser FALSE, pois a inscrição estadual [6461333187422] para o estado ' + e.name() + ' está errada.');
        System.assertEquals(false, mapIEValidacao.get('6461333187413'), 'A validação deveria ser FALSE, pois a inscrição estadual [6461333187413] para o estado ' + e.name() + ' está errada.');
        System.assertEquals(false, mapIEValidacao.get('64613331874130'), 'A validação deveria ser FALSE, pois a inscrição estadual [64613331874130] para o estado ' + e.name() + ' está errada.');
    }
    
    @isTest
    public static void validadorIERO()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.RO;
        List<String> ies = new List<String>();
        ies.add('101625213');
        ies.add('94771223172924');

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
        
        for (String ie : ies)
        {
            System.assertEquals(true, mapIEValidacao.get(ie), 'A validação deveria ser TRUE, pois a inscrição estadual [' + ie + '] para o estado ' + e.name() + ' está correta.');
        }
    }
    
    @isTest
    public static void validadorIERR()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.RR;
        List<String> ies = new List<String>();
        ies.add('240013407');
        ies.add('240013406'); //ERRADO

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
        
        System.assertEquals(true, mapIEValidacao.get('240013407'), 'A validação deveria ser TRUE, pois a inscrição estadual [240013407] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(false, mapIEValidacao.get('240013406'), 'A validação deveria ser FALSE, pois a inscrição estadual [240013406] para o estado ' + e.name() + ' está errada.');
    }
    
    @isTest
    public static void validadorIETO()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.TO;
        List<String> ies = new List<String>();
        ies.add('79030264315');
        ies.add('79877664315'); //ERRADO

        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
        
        System.assertEquals(true, mapIEValidacao.get('79030264315'), 'A validação deveria ser TRUE, pois a inscrição estadual [79030264315] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(false, mapIEValidacao.get('79877664315'), 'A validação deveria ser FALSE, pois a inscrição estadual [79877664315] para o estado ' + e.name() + ' está errada.');
    }
    
    @isTest
    public static void validadorIESP()
    {
        Map<String, Boolean> mapIEValidacao = new Map<String, Boolean>();
        Estado e = Estado.SP;
        List<String> ies = new List<String>();
        ies.add('680945810235');
        ies.add('680945811235'); //1D Errado
        ies.add('P011004243002'); //SP Rural
        
        Test.startTest();
        for (String ie : ies)
        {
            mapIEValidacao.put(ie, ValidadorIEFactory.newInstance(e).execute(ie));
        }
        Test.stopTest();
        
        System.assertEquals(true, mapIEValidacao.get('680945810235'), 'A validação deveria ser TRUE, pois a inscrição estadual [680945810235] para o estado ' + e.name() + ' está correta.');
        System.assertEquals(false, mapIEValidacao.get('680945811235'), 'A validação deveria ser FALSE, pois a inscrição estadual [680945811235] para o estado ' + e.name() + ' está errada.');
        System.assertEquals(true, mapIEValidacao.get('P011004243002'), 'A validação deveria ser TRUE, pois a inscrição estadual [P011004243002] para o estado ' + e.name() + ' está correta.');
    }
    
    @isTest
    public static void validadorIEBranco()
    {     
        Boolean validacao = true;   

        Test.startTest();
        validacao = ValidadorIEFactory.newInstance(Estado.RJ).execute('');
        Test.stopTest();
        
        System.assertEquals(false, validacao, 'A validação deveria ser FALSE, pois a inscrição estadual EM BRANCO para QUALQUER estado deverá ser invalidada');
    }
    
    @isTest
    public static void validadorIETamInvalido()
    {    
        Boolean tamanhoValido;
        
        ValidadorIE v = new ValidadorIE();
        v.inscricaoEstadual = '123456';
        v.tamanho = 2;

        Test.startTest();
        tamanhoValido = v.tamanhoValidado();
        Test.stopTest();
        
        System.assertEquals(false, tamanhoValido, 'A validação deveria ser FALSE, pois a inscrição estadual EM BRANCO para QUALQUER estado deverá ser invalidada');
    }
    
    
    /*
    
    
    
    
    @isTest
    public static void validadorIETamInvalido()
    {        
        Boolean tamanhoValido;
        
        
        ValidadorIE v = new ValidadorIE();
        v.inscricaoEstadual = '123456';
        v.tamanho = 2;
        Test.startTest();
        tamanhoValido = v.tamanhoValidado();
        Test.stopTest();
        
        System.assert(!tamanhoValido);
    } */ 
}