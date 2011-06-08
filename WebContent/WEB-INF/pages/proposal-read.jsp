<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
	</head>

	<body>
		<div class="container">
			<div id="header">
				<jsp:include page="../include/banner.jsp" />
			</div>

			<div id="content_area">
				<div id="left">

					<div id="cadastro">
						<s:url action="proposal-print" id="printUrl">
							<s:param name="report.id" value="report.id" />
						</s:url>
						<br />
						<center><p><b><a href="<s:property value="#printUrl"/>">Imprimir proposta</a></b></p></center>
						<br />
		<h1>Proposta de Informatização</h1>

		<h2>Software</h2>
		<table>
			<tr>
				<th align="left" width="300">Nome</th>
				<th align="right">Valor (R$)</th>
			</tr>
			<tr>
				<td>${report.prospecting.product.name}</td>
				<td align="right">${report.prospecting.productValue}</td>
			</tr>
		</table>

		<h2>Requisitos de implantação</h2>

		<ul>
			<li>Micros à partir de Pentium 800 Mhz com 1 GB de Memória e 30 GB de espaço no HD.</li>
			<li>Necessário acesso à Internet Banda Larga.</li>
			<li>Serviços adicionais como transferência de dados de outros sistemas, transferencia de planilha de preços de fornecedores e configuração de Nota Fiscal serão cobrados a parte.</li>
			<li>Orçamentos e boletos serão cobrados apenas se o impresso for diferente do padrão fornecido pelo Workmotor.</li>
			<li>No pacote de treinamento, o cliente terá direito ao 1º, 2º treinamento e visita de acompanhamento. Esses três requisitos fazem parte do pacote de horas de treinamento comprado. Para adquirir mais horas de treinamento o cliente precisará comprar a parte.  Essas três etapas são apenas se o cliente pagar no mínimo 10 horas de treinamento, caso seja menos horas não será feita o acompanhamento. (treinamento presencial)</li>
			<li>Instalação através de conexão não será cobrada, em exceção se houver pedido do cliente que a instalação seja na empresa.</li>
			<li>Sempre consultar o suporte técnico antes de adquirir uma nova impressora fiscal.</li>
			<li>O Workmotor é compatível com o sistema operacional Windows, exceto com o Windows XP Starter Edition.</li>
			<li>A Workgroup não presta serviços de Configuração de Redes, Manutenção em Micros e Impressoras, Formatação de Windows ou Venda de Impressora Fiscal. Os serviços realizados pela empresa incluem somente os softwares workmotor/workstore.</li>
			<li>Para realizar o treinamento virtual, o cliente necessita de:</li>
			<ul>
				<li>Caixa de som e microfone ou headset no caso de treinamento individual.</li>
				<li>Software gratuito SKYPE, para conversar com o técnico</li>
			</ul>
		</ul>
		
		<h2>Benefícios, atualizações e suporte</h2>
		<h3>Opções:</h3>
		<h3>Data Inicial:</h3>
		<h3>Observação:</h3>
		<p>Os clientes que adquirirem contrato de manutenção, terão direito ao acesso do site queridocarro.com;cota já,  assistência técnica on line e atualizações com as devidas melhorias.                                                                                    </p>
		<p>Clientes que não pagam manutenção, não terão direito à assistência por telefone, não tem direito a assistência por Conexão Remota haja vista não termos a opção de serviços avulsos. Deste modo, a Workgroup não dará assistência a clientes que não pagam manutenção.</p>
		<p>Solicitações de alterações do Workmotor serão analisadas e posteriormente à analise daremos a resposta quanto ao atendimento da solicitação.                                                                                                                          </p>
		<p>Clientes que usam ECF e Nota Fiscal eletrônica terão que adquirir a manutenção mensal por questões técnicas de uso do equipamento.                                                                                                                                    </p>
		<p>Caso o cliente opte por não pagar manutenção e queira a atualização do sistema, pagará por cada atualização que foi feita após a aquisição do sistema, sendo atualmente o valor  de R$ 500,00  por cada atualização.                                                  </p>
		<p>Os clientes que não pagam manutenção e depois quiserem ativar será cobrado uma taxa de ativação, e após 1 ano terá que comprar a licença novamente.                                                                                                                   </p>
		<p>Quando o cliente solicitar visita, será cobrada deslocamento e hora técnica pois a mesma não está inclusa na manutenção.                                                                                                                                              </p>
		<p>A manutenção mensal inclui: atendimento telefônico, suporte remoto e on line através de nosso chat de atendimento em nosso site, atualizações do sistema, acesso ao portal do querido carro , cota já. Visitas tecnicas serão cobradas a parte.                       </p>
		<p>Após a assinatura desta proposta, a empresa fornecedora do software encaminhara ao cliente o respectivo  contrato  de prestação  de serviços e manutenção de sistemas para ser assinado conforme informações apresentadas NO MOMENTO DA                               </p>
		
		<h2>Entrega desta proposta</h2>
		<p>Independente da utilização do sistema a manutenção será paga a parir da data inicial acordada acima.</p>
		
		<table>
			<tr><td>Nome de Fantasia:  </td><td>${report.prospecting.customer.companyName}   </td></tr>
			<tr><td>Telefone:          </td><td>${report.prospecting.customer.phone}         </td></tr>
			<tr><td>FAX:               </td><td>${report.prospecting.customer.fax}           </td></tr>
			<tr><td>E-mail:            </td><td>${report.prospecting.customer.email}         </td></tr>
			<tr><td>CNPJ:              </td><td>${report.prospecting.customer.cnpj}          </td></tr>
			<tr><td>I.E.:              </td><td>${report.prospecting.customer.ie}            </td></tr>
			<tr><td>Endereço:          </td><td>${report.prospecting.customer.address}       </td></tr>
			<tr><td>Bairro:            </td><td>${report.prospecting.customer.neighborhood}  </td></tr>
			<tr><td>UF:                </td><td>${report.prospecting.customer.state}         </td></tr>
			<tr><td>Cidade:            </td><td>${report.prospecting.customer.city}          </td></tr>
			<tr><td>CEP:               </td><td>${report.prospecting.customer.zipCode}       </td></tr>
		</table>
		<p />
		<p />
		<hr />
		<p align="center">Assinatura do Responsável</p>
		<p />
		<p>Por Gentileza, em caso de Aprovação retornar assinado.</p>
		<p>Rua Um Dois Três, 45 - Jd. Seis Sete - Oito/SP - CEP 12345-678 - TEL: (12) 3456-7890 - E-mail: comercial@dasho2.com</p>
					</div>

				</div>
				
			</div>
			<div class="cleaner"></div>
			<div id="footer_background">
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</body>
</html>
