package com.dasho2.pk.action;

import java.util.List;

import com.dasho2.pk.dao.entity.Prospecting;
import com.dasho2.pk.dao.entity.Report;
import com.dasho2.pk.dao.service.ProspectingDaoServiceHibernate;
import com.dasho2.pk.dao.service.ProspectingDaoServiceInterface;
import com.dasho2.pk.dao.service.ReportDaoServiceHibernate;
import com.dasho2.pk.dao.service.ReportDaoServiceInterface;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class ReportAction extends ActionSupport implements Preparable {
	private static ProspectingDaoServiceInterface prospectingDaoServiceInterface = new ProspectingDaoServiceHibernate();
	private List<Prospecting> prospectings;
	private Prospecting prospecting;

	private List<Report> reports;
	private Report report;
	private static ReportDaoServiceInterface service = new ReportDaoServiceHibernate();

	public void prepare() throws Exception {
		if (prospecting != null && prospecting.getId() != null) {
			prospecting = prospectingDaoServiceInterface.getById(prospecting.getId());
		}
		if (report != null && report.getId() != null) {
			report = service.getById(report.getId());
		}
	}

	public String save() {
		report = new Report();
		report.updateModificationDate();
		report.setProspecting(getProspecting());
		service.insert(report);

		return SUCCESS;
	}

	public String read() {
		return SUCCESS;
	}

	public String print() {
		return SUCCESS;
	}

	public String delete() {
		service.delete(report.getId());
		return SUCCESS;
	}

	public String list() {
		reports = service.getAll();
		return SUCCESS;
	}

	public String input() {
		prospectings = prospectingDaoServiceInterface.getAll();
		return INPUT;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public List<Report> getReports() {
		return reports;
	}

	public List<Prospecting> getProspectings() {
		return prospectings;
	}

	public Prospecting getProspecting() {
		return prospecting;
	}

	public void setProspecting(Prospecting prospecting) {
		this.prospecting = prospecting;
	}

}
