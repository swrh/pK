<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp" />
<%-- 		<jsp:include page="../include/head-form.jsp">
			<jsp:param name="cancelUrl" value="prospecting-index" />
			<jsp:param name="deleteUrl" value="prospecting-crud!delete?prospecting.id=${prospecting.id}" />
		</jsp:include>
		<script language="javascript" type="text/javascript" src="<s:url value='/js/prospect.js' />"></script>
 --%>	</head>

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
							Relatório código ${report.id}
						</h1>
						<s:url id="createProposalUrl" action="proposal-read">
							<s:param name="report.id" value="report.id" />
						</s:url>
						<a href="<s:property value="createProposalUrl" />" class="linknew">Gerar proposta</a>
						<s:form action="#">
							<s:hidden name="prospecting.id" value="%{report.prospecting.id}" disabled="true" />
							<s:hidden name="report.id" value="%{report.id}" disabled="true" />

							<s:label       name="report.prospecting.id"                         value="%{report.prospecting.id}"                         label="Código da prospecção"                  cssClass="textField_id"                                                                                     disabled="true" />
							<s:label       name="report.prospecting.customer.companyName"       value="%{report.prospecting.customer.companyName}"                                          label="Razão Social"            cssClass="textField_companyName"                                       id="customer_companyName"            disabled="true" />
							<s:label       name="report.prospecting.customer.email"             value="%{report.prospecting.customer.email}"                                          label="E-mail"                  cssClass="textField_email"                                             id="customer_email"                  disabled="true" />
							<s:label       name="report.prospecting.customer.phone"             value="%{report.prospecting.customer.phone}"                                          label="Telefone"                cssClass="textField_phone"                                             id="customer_phone"                  disabled="true" />
							<s:label       name="report.prospecting.customer.mobile"            value="%{report.prospecting.customer.mobile}"                                          label="Celular"                 cssClass="textField_phone"                                             id="customer_mobile"                 disabled="true" />
							<s:label       name="report.prospecting.customer.fax"               value="%{report.prospecting.customer.fax}"                                          label="FAX"                     cssClass="textField_phone"                                             id="customer_fax"                    disabled="true" />
							<s:label       name="report.prospecting.customer.city"              value="%{report.prospecting.customer.city}"                                          label="Cidade"                  cssClass="textField_address"                                           id="customer_city"                   disabled="true" />
							<s:label       name="report.prospecting.customer.state"             value="%{report.prospecting.customer.state}"                                          label="Estado"                  cssClass="textField_address"                                           id="customer_state"                  disabled="true" />
							<s:label       name="report.prospecting.customer.zipCode"           value="%{report.prospecting.customer.zipCode}"                                          label="CEP"                     cssClass="textField_zipCode"                                           id="customer_zipCode"                disabled="true" />
							<s:label       name="report.prospecting.product.name"               value="%{report.prospecting.product.name}"                 label="Produto"                 listKey="id" listValue="name"      />
							<s:label       name="report.prospecting.productValue"               value="%{report.prospecting.productValue}"                 label="Valor (R$)"                 listKey="id" listValue="textField_phone"      />
							<s:label       name="report.prospecting.finishingReason.name"       value="%{report.prospecting.finishingReason.name}"         label="Motivo de Encerramento"  listKey="id" listValue="name"      />
							<s:label       name="report.prospecting.employee.name"              value="%{report.prospecting.employee.name}"                label="Funcionário"             listKey="id" listValue="name"      />
							<s:label       name="report.prospecting.operation.name"             value="%{report.prospecting.operation.name}"               label="Ação"                    listKey="id" listValue="name"      />
							<s:label       name="report.prospecting.indication.name"            value="%{report.prospecting.indication.partner}"              label="Indicação"               listKey="id" listValue="partner"   />
							<s:if test="report.prospecting.proposalStatus.finishing == true">
								<s:label       name="report.prospecting.proposalStatus.finishing"   value="fechada"          label="Estado da Proposta"      listKey="id" listValue="name"     list="proposalStatuss"               id="selected_proposalStatus_id" />
							</s:if>
							<s:else>
								<s:label       name="report.prospecting.proposalStatus.finishing"   value="em aberto"          label="Estado da Proposta"      listKey="id" listValue="name"     list="proposalStatuss"               id="selected_proposalStatus_id" />
							</s:else>
							<s:label       name="report.prospecting.visitDateString"            value="%{report.prospecting.visitDateString}"                  label="Última Visita"           displayFormat="dd/MM/yy"  />
							<s:label       name="report.prospecting.visitTimeString"            value="%{report.prospecting.visitTimeString}"                  label="-"                       displayFormat="HH:mm"     type="time" />
							<s:label       name="report.prospecting.creationDateString"         value="%{report.prospecting.creationDateString}"         label="Criado em"               cssClass="textField_dateTime"                                                                               disabled="true" />
							<s:label       name="report.prospecting.modificationDateString"     value="%{report.prospecting.modificationDateString}"     label="Modificado em"           cssClass="textField_dateTime"                                                                               disabled="true" />
						</s:form>
					</div>


							<s:iterator value="report.prospecting.history">
								<s:url action="employee-crud!input" id="employeeUrl">
									<s:param name="employee.id" value="employee.id" />
								</s:url>
								<hr />
								<a href="<s:property value="#employeeUrl" />"><s:property value="employee.name" /></a> - <s:property value="timeString" /><br />
								<s:property value="text" /><br />
								<br />
							</s:iterator>



<%-- 	                    <div id="#history">
							<div id="historydata_whatever">
								<table>
									<tr id="nohistory">
										<td>Sem histórico</td>
									</tr>
								</table>
							</div>
							<div id="historydata"></div>
							<br />
							<a href="#" id="new_hist_link"><img src="<s:url value='/images/add.png' />" alt="Adiciona novo histórico de contato" /></a>
							
							<div id="new_hist">
								Novo Item de Histórico<br/>
								<textarea rows="5" cols="37" id="history_text"></textarea><br/>
								<a href="#" id="new_hist_ok"><img src="<s:url value='/images/ok.png' />" alt="Salva histórico de contato" /></a><a href="#" id="new_hist_cancel"><img src="<s:url value='/images/cancel.png' />" alt="Cancela operação" /></a>
							</div>
						</div>
 --%>
				</div>

			</div>
			<div class="cleaner"></div>
			<div id="footer_background">
				<jsp:include page="../include/footer.jsp" />
			</div>
		</div>
	</body>
</html>
