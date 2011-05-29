<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<s:if test="prospecting == null || prospecting.id == null">
	<s:set name="title" value="%{'Criar nova prospecção'}" />
</s:if>
<s:else>
	<s:set name="title" value="%{'Atualizar prospecção'}" />
</s:else>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="prospecting-index" />
			<jsp:param name="deleteUrl" value="prospecting-crud!delete?prospecting.id=${prospecting.id}" />
		</jsp:include>
		<script language="javascript" type="text/javascript" src="<s:url value='/js/prospect.js' />"></script>
		<script language="javascript" type="text/javascript" >
			$(document).ready(function() {
				$("select:#selected_customer_id").change(function () {
					var id = $("select:#selected_customer_id option:selected").val();
					$.post("customer-json", { "customer.id" : id }, function(json) {
						c = json.customer;

						$.fn.update_customer(c);
					})
					.error(function() {
						c = {
							id                     : "",
							companyName            : "",
							cnpj                   : "",
							ie                     : "",
							email                  : "",
							phone                  : "",
							mobile                 : "",
							fax                    : "",
							address                : "",
							neighborhood           : "",
							city                   : "",
							state                  : "",
							zipCode                : "",
							creationDateString     : "",
							modificationDateString : ""
						};

						$.fn.update_customer(c);
					});
				}).trigger('change');
			});

			$.fn.update_customer = function(c) {
				$("input:#customer_id"                     ).val(c.id                     );
				$("input:#customer_companyName"            ).val(c.companyName            );
				$("input:#customer_cnpj"                   ).val(c.cnpj                   );
				$("input:#customer_ie"                     ).val(c.ie                     );
				$("input:#customer_email"                  ).val(c.email                  );
				$("input:#customer_phone"                  ).val(c.phone                  );
				$("input:#customer_mobile"                 ).val(c.mobile                 );
				$("input:#customer_fax"                    ).val(c.fax                    );
				$("input:#customer_address"                ).val(c.address                );
				$("input:#customer_neighborhood"           ).val(c.neighborhood           );
				$("input:#customer_city"                   ).val(c.city                   );
				$("input:#customer_state"                  ).val(c.state                  );
				$("input:#customer_zipCode"                ).val(c.zipCode                );
				$("input:#customer_creationDateString"     ).val(c.creationDateString     );
				$("input:#customer_modificationDateString" ).val(c.modificationDateString );
			};
		</script>
	</head>

	<body>
		<div class="container">
			<div id="header">
				<jsp:include page="../include/banner.jsp" />
			</div>

			<div id="content_area">
				<div id="left">

					<div id="cadastro">
						<br />
						<h1>
							<s:property value="#title" />
						</h1>
						<s:actionerror />
						<s:actionmessage />
						<s:form action="prospecting-crud!save.action" method="post">
							<s:hidden name="prospecting.id" value="%{prospecting.id}" />

							<s:textfield name="prospecting.id"                      value="%{prospecting.id}"                      label="Código"                 cssClass="textField_id"           disabled="true" />
							<s:select    name="prospecting.customer.id"             value="%{prospecting.customer.id}"             label="Cliente"                listKey="id" listValue="name"     list="customers" id="selected_customer_id"/>

							<s:textfield name="customer.id"                         value=""                                       label="Código"                 cssClass="textField_id"           id="customer_id"                     disabled="true"  />
							<s:textfield name="customer.companyName"                value=""                                       label="Razão Social"           cssClass="textField_companyName"  id="customer_companyName"            disabled="true"  />
							<s:textfield name="customer.cnpj"                       value=""                                       label="CNPJ"                   cssClass="textField_any"          id="customer_cnpj"                   disabled="true"  />
							<s:textfield name="customer.ie"                         value=""                                       label="I.E."                   cssClass="textField_any"          id="customer_ie"                     disabled="true"  />
							<s:textfield name="customer.email"                      value=""                                       label="E-mail"                 cssClass="textField_email"        id="customer_email"                  disabled="true"  />
							<s:textfield name="customer.phone"                      value=""                                       label="Telefone"               cssClass="textField_phone"        id="customer_phone"                  disabled="true"  />
							<s:textfield name="customer.mobile"                     value=""                                       label="Celular"                cssClass="textField_phone"        id="customer_mobile"                 disabled="true"  />
							<s:textfield name="customer.fax"                        value=""                                       label="FAX"                    cssClass="textField_phone"        id="customer_fax"                    disabled="true"  />
							<s:textfield name="customer.address"                    value=""                                       label="Rua"                    cssClass="textField_address"      id="customer_address"                disabled="true"  />
							<s:textfield name="customer.neighborhood"               value=""                                       label="Bairro"                 cssClass="textField_address"      id="customer_neighborhood"           disabled="true"  />
							<s:textfield name="customer.city"                       value=""                                       label="Cidade"                 cssClass="textField_address"      id="customer_city"                   disabled="true"  />
							<s:textfield name="customer.state"                      value=""                                       label="Estado"                 cssClass="textField_address"      id="customer_state"                  disabled="true"  />
							<s:textfield name="customer.zipCode"                    value=""                                       label="CEP"                    cssClass="textField_zipCode"      id="customer_zipCode"                disabled="true"  />
							<s:textfield name="customer.creationDateString"         value=""                                       label="Criado em"              cssClass="textField_dateTime"     id="customer_creationDateString"     disabled="true"  />
							<s:textfield name="customer.modificationDateString"     value=""                                       label="Modificado em"          cssClass="textField_dateTime"     id="customer_modificationDateString" disabled="true"  />

							<s:select    name="prospecting.finishingReason.id"      value="%{prospecting.finishingReason.id}"      label="Razão de Encerramento"  listKey="id" listValue="name"     list="finishingReasons" />
							<s:select    name="prospecting.employee.id"             value="%{prospecting.employee.id}"             label="Funcionário"            listKey="id" listValue="name"     list="employees" />
							<s:select    name="prospecting.operation.id"            value="%{prospecting.operation.id}"            label="Ação"                   listKey="id" listValue="name"     list="operations" />
							<s:select    name="prospecting.indication.id"           value="%{prospecting.indication.id}"           label="Indicação"              listKey="id" listValue="partner"  list="indications" />
							<s:select    name="prospecting.proposalStatus.id"       value="%{prospecting.proposalStatus.id}"       label="Estado da Proposta"     listKey="id" listValue="name"     list="proposalStatuss" />

							<s:textfield name="prospecting.creationDateString"      value="%{prospecting.creationDateString}"      label="Criado em"              cssClass="textField_dateTime"     disabled="true" />
							<s:textfield name="prospecting.modificationDateString"  value="%{prospecting.modificationDateString}"  label="Modificado em"          cssClass="textField_dateTime"     disabled="true" />

							<s:submit id="btn_salvar" value="Salvar" />
							<s:submit id="btn_apagar" value="Excluir" />
							<s:submit id="btn_cancelar" value="Cancelar" />
						</s:form>
					</div>

				</div>
				
				<!-- Right menu  -->
				
				<div id="right">
            	<div class="sidebar">
                	<div class="sidebar_banner">
                    Histórico
                    </div>
                    <div class="sidebar_content">
	                    <div id="#history">

							<div id="historydata">
								<table>
									<tr id="nohistory">
										<td>Sem histórico</td>
									</tr>
								</table>
							</div>
							
							<a href="#" id="new_hist_link"><img src="<s:url value='/images/add.png' />" alt="Adiciona novo histórico de contato" /></a>
							
							<div id="new_hist">
								Novo Item de Histórico<br/>
								<textarea rows="5" cols="37" id="history_text"></textarea><br/>
								<a href="#" id="new_hist_ok"><img src="<s:url value='/images/ok.png' />" alt="Salva histórico de contato" /></a><a href="#" id="new_hist_cancel"><img src="<s:url value='/images/cancel.png' />" alt="Cancela operação" /></a>
							</div>
							
						</div>
                    </div>
				</div>
                   
                </div>
				
				<!--  Right menu -->
				
				
			</div>
			<div class="cleaner"></div>
			<div id="footer_background">
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</body>
</html>
