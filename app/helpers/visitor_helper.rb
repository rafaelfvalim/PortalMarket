module VisitorHelper
  def get_message_lounge
    imgage = image_tag "KLU001-logotipo_simbolo-positivo.png", crop: :fill, class: "klustter-lounge-logo"
    telefone = t 'labels.tel'
    mail = mail_to 'b2b@klustter.com.br'
    if current_user.is_customer?
      html_customer = <<-HTML
       <div class="row">
          <div class="col-lg-4">
            #{imgage}
          </div>
          <div class="col-lg-7">
            <h2 class="header-lounge"><b>Bem vindo ao universo Klustter.</b></h2>
            <p>Agora você está conectado em universo de conhecimento compartilhado.
              Falta pouco para que você possa ter acesso aos scripts que irão oferecer
              soluções nunca alcançadas.</p>
            <p>Próximos Passos:</p>
            <ol>
              <li>
                O pessoal de B2B entrará em contato para que questões comerciais e jurídicas sejam discutidas.
              </li>
              <li>
                Depois é só assinar o contrato e ampliar o seu universo de conhecimento.
              </li>
            </ol>

            <hr>
            <p>Precisa de ajuda ?</p>
            <p>Contacte o B2B</p>
            <p>Telefone: #{telefone} </p>
            <p>Email: #{mail} </p>
          </div>
        </div>
      HTML
      html_customer.html_safe
    end
    if current_user.is_contributor?
      html_contributor = <<-HTML
       <div class="row">
          <div class="col-lg-4">
            #{imgage}
          </div>
          <div class="col-lg-7">
            <h2 class="header-lounge"><b>Bem vindo ao universo Klustter.</b></h2>
            <p>Agora você está conectado em universo de conhecimento compartilhado.
               Falta pouco para que um universo de clientes tenha acesso às tuas soluções.</p>
            <p>Próximos Passos:</p>
            <ol>
              <li>O pessoal de Canal de Parceiros entrará em contato para que questões as jurídicas sejam apresentadas.</li>
              <li>Depois é só assinar o contrato e ampliar o seu universo de cliente.</li>
            </ol>

            <hr>
            <p>Precisa de ajuda ?</p>
            <p>Contacte o B2B</p>
            <p>Telefone: #{telefone} </p>
            <p>Email: #{mail} </p>
          </div>
        </div>
      HTML
      html_contributor.html_safe
    end
    if current_user.is_god?
      html_contributor = <<-HTML
       <div class="row">
          <div class="col-lg-4">
            #{imgage}
          </div>
          <div class="col-lg-7">
            <h2 class="header-lounge"><b>Bem vindo ao universo Klustter.</b></h2>
            <p>Caro administrador seus dados já estão sendo valdiados e logo você terá acesso a todas as ferrematas do Portal Klustter</p>
             <p>Próximos Passos:</p>
            <ol>
              <li>O pessoal de Canal de Parceiros entrará em contato para que questões as jurídicas sejam apresentadas.</li>
            </ol>
            <hr>
            <p>Precisa de ajuda ?</p>
            <p>Contacte o B2B</p>
            <p>Telefone: #{telefone} </p>
            <p>Email: #{mail} </p>
          </div>
        </div>
      HTML
      html_contributor.html_safe
    end
  end
end
