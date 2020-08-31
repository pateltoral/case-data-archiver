/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "cda_appointment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CdaAppointment.findAll", query = "SELECT c FROM CdaAppointment c"),
    @NamedQuery(name = "CdaAppointment.findByAppointmentid", query = "SELECT c FROM CdaAppointment c WHERE c.appointmentid = :appointmentid"),
    @NamedQuery(name = "CdaAppointment.findByPid", query = "SELECT c FROM CdaAppointment c WHERE c.pid = :pid"),
    @NamedQuery(name = "CdaAppointment.findByPname", query = "SELECT c FROM CdaAppointment c WHERE c.pname = :pname"),
    @NamedQuery(name = "CdaAppointment.findByAppDate", query = "SELECT c FROM CdaAppointment c WHERE c.appDate = :appDate"),
    @NamedQuery(name = "CdaAppointment.findByAppTime", query = "SELECT c FROM CdaAppointment c WHERE c.appTime = :appTime"),
    @NamedQuery(name = "CdaAppointment.findByApptype", query = "SELECT c FROM CdaAppointment c WHERE c.apptype = :apptype")})
public class CdaAppointment implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "appointmentid")
    private Long appointmentid;
    @Basic(optional = false)
    @Column(name = "pid")
    private long pid;
    @Basic(optional = false)
    @Column(name = "pname")
    private String pname;
    @Basic(optional = false)
    @Column(name = "app_date")
    @Temporal(TemporalType.DATE)
    private Date appDate;
    @Basic(optional = false)
    @Column(name = "app_time")
    private String appTime;
    @Basic(optional = false)
    @Column(name = "apptype")
    private String apptype;

    public CdaAppointment() {
    }

    public CdaAppointment(Long appointmentid) {
        this.appointmentid = appointmentid;
    }

    public CdaAppointment(Long appointmentid, long pid, String pname, Date appDate, String appTime, String apptype) {
        this.appointmentid = appointmentid;
        this.pid = pid;
        this.pname = pname;
        this.appDate = appDate;
        this.appTime = appTime;
        this.apptype = apptype;
    }

    public Long getAppointmentid() {
        return appointmentid;
    }

    public void setAppointmentid(Long appointmentid) {
        this.appointmentid = appointmentid;
    }

    public long getPid() {
        return pid;
    }

    public void setPid(long pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Date getAppDate() {
        return appDate;
    }

    public void setAppDate(Date appDate) {
        this.appDate = appDate;
    }

    public String getAppTime() {
        return appTime;
    }

    public void setAppTime(String appTime) {
        this.appTime = appTime;
    }

    public String getApptype() {
        return apptype;
    }

    public void setApptype(String apptype) {
        this.apptype = apptype;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (appointmentid != null ? appointmentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CdaAppointment)) {
            return false;
        }
        CdaAppointment other = (CdaAppointment) object;
        if ((this.appointmentid == null && other.appointmentid != null) || (this.appointmentid != null && !this.appointmentid.equals(other.appointmentid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CdaAppointment[ appointmentid=" + appointmentid + " ]";
    }
    
}
