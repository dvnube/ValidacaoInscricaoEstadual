Validação de Inscrição Estadual
==

<a href="https://test.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3ZAAA0">
  <img alt="Deploy Sandbox"
       src="./images/deploysandbox.jpg">
</a>

<a href="https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3ZAAA0">
  <img alt="Deploy Production"
       src="./images/deployproduction.jpg"/>
</a>

Deploy via link
==
 - Sandbox: https://test.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3ZAAA0
 - Production: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4x000000Z3ZAAA0
 
Uso
==
 - Coloquei o componente numa [comunidade pública](https://help.salesforce.com/articleView?id=community_builder_page_access_settings.htm&type=5) para livre uso, divirtam-se.
 - Link: https://dvnube01-developer-edition.na150.force.com/s/
	

Caso de uso
==
- Quem deve ter Inscrição Estadual e quem deve validá-la?
  - [Como regra geral, todas as empresas que comercializam produtos precisam ter Inscrição Estadual. Aquelas que apenas trabalham com serviços não estão obrigadas a realizá-la, pois devem recolher o tributo do ISS (Imposto sobre Serviços), que é de competência municipal.](https://quickbooks.intuit.com/br/blog/documentacao/inscricao-estadual-empresa/#:~:text=Quem%20deve%20ter%20Inscri%C3%A7%C3%A3o%20Estadual%3F,que%20%C3%A9%20de%20compet%C3%AAncia%20municipal.)
  - Caso o número não seja válido, o **Financeiro** da empresa com certeza descobrirá, em algum momento, pois é utilizado para encargos relativos ao [ICMS](https://www.qipu.com.br/dicionario/inscricao-estadual/#:~:text=A%20Inscri%C3%A7%C3%A3o%20Estadual%20%C3%A9%20um,que%20tenham%20repasse%20de%20mercadorias.).


Solução e objetivo
==
- Solução
  - Realizar a [validação da Inscrição Estadual](http://www.sintegra.gov.br/insc_est.html) de maneira simples, através de um componente altamente personalizado
- Objetivo  
  - Facilitar a validação da Inscrição Estadual pelo usuário final
  - Contribuir com a comunidade Salesforce
  - Disponibilizar, gratuitamente e com o código aberto, para incentivar [estudo](https://trailhead.salesforce.com/) e melhorias



Instalação
==
1) Clique no botão relativo ao ambiente que irá instalá-lo (*Sandbox* ou *Produção*)
	- No exemplo, iremos instalá-lo em ***Developer Edition***, que é um ambiente de *Produção*.
2) Efetue login
3) Selecione para quem deseja instalar
	- Esse passo dependerá do seu uso em relação ao componente
	- Você pode selecionar a instalação somente para admins, para todos os usuários ou para perfis específicos
4) Clique em **Instalação**
5) Aguarde a Instalação e aparecerá uma tela para clicar em **Concluído**
6) Você será redirecionado para a tela de **Pacotes instalados**
Fim.
	

Sobre
==

- Inicialmente eu desenvolvi apenas o *motor* da validação de [Inscrição Estadual](http://www.sintegra.gov.br/insc_est.html) para um cliente que não queria depender de API de terceiros.
- Decidi aprimorá-lo e construir um [Lightning Web Component](https://trailhead.salesforce.com/pt-BR/content/learn/modules/lightning-web-components-basics) para facilitar seu uso, visto que o "motor" só era utilizado a partir de uma [Trigger](https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_triggers/apex_triggers_intro)
- A ideia em disponibilizá-lo publicamente com o código aberto é incentivar o estudo e o aprimoramento do componente.
- Sintam-se a vontade para utilizá-lo em seus ambientes, customizar da maneira que quiserem, corrigir bugs, etc.

<img alt="" src="./images/exemploValido.gif"/>

Sobre o desenvolvimento
==

- Apliquei alguns padrões de [herança e polimorfismo](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_example.htm) nessa aplicação
- Classes:
  - 1 Enum
  - 1 Interface
  - 1 Utils
  - 1 Controller
  - 1 Virtual
  - 1 Factory
  - 27 que extendem a virtual e implementam a interface
  - 2 Test
- [Lightning Web Component](https://trailhead.salesforce.com/pt-BR/content/learn/modules/lightning-web-components-basics) que pode ser totalmente personalizado
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

Agradecimentos
==

Todos que participaram, de alguma maneira, direta ou indireta, meu MUITO obrigado!
Espero que seja apenas a minha primeira contribuição de muitas que estão por vir...

Agradecimento especial para minha mulher e filha (tá..os bichos também...). 
Sem vocês eu não conseguiria nada. Amo vocês!

Contato - Sobre qualquer assunto!
==
<a href="https://www.linkedin.com/in/renato-de-vico/">
  <img alt="Deploy Production"
       src="./images/linkedinLogo.png"/>	  
</a>

[Clique na imagem acima para ser redirecionado ou, se preferir, clique aqui](https://www.linkedin.com/in/renato-de-vico/)



Até a próxima.




