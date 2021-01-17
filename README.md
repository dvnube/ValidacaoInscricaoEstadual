Validação de Inscrição Estadual
==

<a href="https://test.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3QaAAK">
  <img alt="Deploy Sandbox"
       src="./images/deploysandbox.jpg">
</a>

<a href="https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3QaAAK">
  <img alt="Deploy Production"
       src="./images/deployproduction.jpg"/>
</a>

Sobre
==

- Inicialmente eu desenvolvi apenas o "motor" de validação de [Inscrição Estadual](http://www.sintegra.gov.br/insc_est.html) para um cliente que não queria depender de API de terceiros.
- Agora eu resolvi aprimorá-lo e construí um [Lightning Web Component](https://trailhead.salesforce.com/pt-BR/content/learn/modules/lightning-web-components-basics) para facilitar seu uso, visto que no cliente era apenas chamado a partir de uma [Trigger](https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_triggers/apex_triggers_intro)

<img alt="" src="./images/exemploValido.gif"/>

Sobre o desenvolvimento
==

- Apliquei alguns padrões de [Heranças e polimorfismo](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_example.htm) nessa aplicação
- Classes:
  - 1 Enum
  - 1 Interface
  - 1 Utils
  - 1 Controller
  - 1 Virtual
  - 1 Factory
  - 27 que extendem a virtual e implementam a interface
  - 2 Test
- [Lightning Web Component](https://trailhead.salesforce.com/pt-BR/content/learn/modules/lightning-web-components-basics) que pode ser totalmente persoalizado
- Custom labels
- Static resources

Configuração
==

Através do [Lightning App Builder](https://help.salesforce.com/articleView?id=lightning_app_builder_customize_lex_pages.htm&type=5), é possível customizar **quase** tudo, no que se diz respeito ao visual:

<img alt="" src="./images/appBuilder.gif"/>

<img alt="" src="./images/configuracaoApp1.jpg"/>

<img alt="" src="./images/configuracaoApp2.jpg"/>

Mobile
==

Apesar de minha limitação com CSS, consegui deixá-lo pronto para mobile

<img alt="" src="./images/telaMobile.jpg"/>



 
  
  
  
  
  
  
  

Is derived from the **Dreamforce 2012** presentation on [Apex Enterprise Patterns](https://github.com/financialforcedev/df12-apex-enterprise-patterns) and progresses the patterns further with a more general ongoing home for them. It also adds some form of namespace qualification from the previous version. So that classes are grouped together more easily in the IDE's and packages. Below you can find comprehensive articles and videos on the use of these patterns. There is also a **working sample application** illustrating the patterns [here](https://github.com/apex-enterprise-patterns/fflib-apex-common-samplecode).

Dreamforce Session and Slides
-----------------------------

- View slides for the **Dreamforce 2013** session [here](https://docs.google.com/file/d/0B6brfGow3cD8RVVYc1dCX2s0S1E/edit) 
- Video recording of the **Dreamforce 2013** session [here](http://www.youtube.com/watch?v=qlq46AEAlLI).
- Video recording of the **Advanced Apex Enterprise Dreamforce 2014** session [here](http://dreamforce.vidyard.com/watch/7QtP2628KmtXfmiwI-7B1w%20).
- View slides for the **Dreamforce 2015** session [here](http://www.slideshare.net/andyinthecloud/building-strong-foundations-apex-enterprise-patterns)

Documentation
-------------

- [Apex Sharing and applying to Apex Enterprise Patterns](http://andyinthecloud.com/2016/01/10/apex-sharing-and-applying-to-apex-enterprise-patterns/)
- [Tips for Migrating to Apex Enterprise Patterns](http://andyinthecloud.com/2015/09/30/tips-for-migrating-to-apex-enterprise-patterns/)
- [Great Contributions to Apex Enterprise Patterns](http://andyinthecloud.com/2015/07/25/great-contributions-to-apex-enterprise-patterns/)
- [Unit Testing, Apex Enterprise Patterns and ApexMocks – Part 1](http://andyinthecloud.com/2015/03/22/unit-testing-with-apex-enterprise-patterns-and-apexmocks-part-1/)
- [Unit Testing, Apex Enterprise Patterns and ApexMocks – Part 2](http://andyinthecloud.com/2015/03/29/unit-testing-apex-enterprise-patterns-and-apexmocks-part-2/)
- [Apex Enterprise Patterns - Separation of Concerns](http://wiki.developerforce.com/page/Apex_Enterprise_Patterns_-_Separation_of_Concerns)
- [Apex Enterprise Patterns - Service Layer](http://wiki.developerforce.com/page/Apex_Enterprise_Patterns_-_Service_Layer)
- [Apex Enterprise Patterns - Domain Layer](http://wiki.developerforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer)
- [Apex Enterprise Patterns - Selector Layer](https://github.com/financialforcedev/df12-apex-enterprise-patterns#data-mapper-selector)

**Other Related Blogs**

- [Preview of Advanced Apex Patterns Session (Application Factory and ApexMocks Features)](http://andyinthecloud.com/2014/08/26/preview-of-advanced-apex-enterprise-patterns-session/)
- [Unit Testing with the Domain Layer](http://andyinthecloud.com/2014/03/23/unit-testing-with-the-domain-layer/)
- [MavensMate Templates](http://andyinthecloud.com/2014/05/23/mavensmate-templates-and-apex-enterprise-patterns/)
- [FinancialForce Apex Common Updates](http://andyinthecloud.com/2014/06/28/financialforce-apex-common-updates/)

