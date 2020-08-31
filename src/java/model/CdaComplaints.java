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
import javax.persistence.Lob;
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
@Table(name = "cda_complaints")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CdaComplaints.findAll", query = "SELECT c FROM CdaComplaints c"),
    @NamedQuery(name = "CdaComplaints.findByCompid", query = "SELECT c FROM CdaComplaints c WHERE c.compid = :compid"),
    @NamedQuery(name = "CdaComplaints.findByCid", query = "SELECT c FROM CdaComplaints c WHERE c.cid = :cid"),
    @NamedQuery(name = "CdaComplaints.findByPid", query = "SELECT c FROM CdaComplaints c WHERE c.pid = :pid"),
    @NamedQuery(name = "CdaComplaints.findByCompDate", query = "SELECT c FROM CdaComplaints c WHERE c.compDate = :compDate"),
    @NamedQuery(name = "CdaComplaints.findByDaysOfMedicine", query = "SELECT c FROM CdaComplaints c WHERE c.daysOfMedicine = :daysOfMedicine"),
    @NamedQuery(name = "CdaComplaints.findByAmount", query = "SELECT c FROM CdaComplaints c WHERE c.amount = :amount"),
    @NamedQuery(name = "CdaComplaints.findByUnpaid", query = "SELECT c FROM CdaComplaints c WHERE c.unpaid = :unpaid"),
    @NamedQuery(name = "CdaComplaints.findByDeposit", query = "SELECT c FROM CdaComplaints c WHERE c.deposit = :deposit")})
public class CdaComplaints implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "compid")
    private Long compid;
    @Basic(optional = false)
    @Column(name = "cid")
    private long cid;
    @Basic(optional = false)
    @Column(name = "pid")
    private long pid;
    @Basic(optional = false)
    @Column(name = "comp_date")
    @Temporal(TemporalType.DATE)
    private Date compDate;
    @Basic(optional = false)
    @Lob
    @Column(name = "complaints")
    private String complaints;
    @Basic(optional = false)
    @Lob
    @Column(name = "medicine")
    private String medicine;
    @Basic(optional = false)
    @Column(name = "days_of_medicine")
    private int daysOfMedicine;
    @Basic(optional = false)
    @Column(name = "amount")
    private int amount;
    @Basic(optional = false)
    @Column(name = "unpaid")
    private int unpaid;
    @Basic(optional = false)
    @Column(name = "deposit")
    private int deposit;

    public CdaComplaints() {
    }

    public CdaComplaints(Long compid) {
        this.compid = compid;
    }

    public CdaComplaints(Long compid, long cid, long pid, Date compDate, String complaints, String medicine, int daysOfMedicine, int amount, int unpaid, int deposit) {
        this.compid = compid;
        this.cid = cid;
        this.pid = pid;
        this.compDate = compDate;
        this.complaints = complaints;
        this.medicine = medicine;
        this.daysOfMedicine = daysOfMedicine;
        this.amount = amount;
        this.unpaid = unpaid;
        this.deposit = deposit;
    }

    public Long getCompid() {
        return compid;
    }

    public void setCompid(Long compid) {
        this.compid = compid;
    }

    public long getCid() {
        return cid;
    }

    public void setCid(long cid) {
        this.cid = cid;
    }

    public long getPid() {
        return pid;
    }

    public void setPid(long pid) {
        this.pid = pid;
    }

    public Date getCompDate() {
        return compDate;
    }

    public void setCompDate(Date compDate) {
        this.compDate = compDate;
    }

    public String getComplaints() {
        return complaints;
    }

    public void setComplaints(String complaints) {
        this.complaints = complaints;
    }

    public String getMedicine() {
        return medicine;
    }

    public void setMedicine(String medicine) {
        this.medicine = medicine;
    }

    public int getDaysOfMedicine() {
        return daysOfMedicine;
    }

    public void setDaysOfMedicine(int daysOfMedicine) {
        this.daysOfMedicine = daysOfMedicine;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getUnpaid() {
        return unpaid;
    }

    public void setUnpaid(int unpaid) {
        this.unpaid = unpaid;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (compid != null ? compid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CdaComplaints)) {
            return false;
        }
        CdaComplaints other = (CdaComplaints) object;
        if ((this.compid == null && other.compid != null) || (this.compid != null && !this.compid.equals(other.compid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CdaComplaints[ compid=" + compid + " ]";
    }
    
}
