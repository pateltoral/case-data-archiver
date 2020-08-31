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
@Table(name = "cda_case")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CdaCase.findAll", query = "SELECT c FROM CdaCase c"),
    @NamedQuery(name = "CdaCase.findByCid", query = "SELECT c FROM CdaCase c WHERE c.cid = :cid"),
    @NamedQuery(name = "CdaCase.findByPid", query = "SELECT c FROM CdaCase c WHERE c.pid = :pid"),
    @NamedQuery(name = "CdaCase.findByPName", query = "SELECT c FROM CdaCase c WHERE c.pName = :pName"),
    @NamedQuery(name = "CdaCase.findByCDate", query = "SELECT c FROM CdaCase c WHERE c.cDate = :cDate")})
public class CdaCase implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cid")
    private Long cid;
    @Basic(optional = false)
    @Column(name = "pid")
    private long pid;
    @Basic(optional = false)
    @Column(name = "p_name")
    private String pName;
    @Basic(optional = false)
    @Column(name = "c_date")
    @Temporal(TemporalType.DATE)
    private Date cDate;

    public CdaCase() {
    }

    public CdaCase(Long cid) {
        this.cid = cid;
    }

    public CdaCase(Long cid, long pid, String pName, Date cDate) {
        this.cid = cid;
        this.pid = pid;
        this.pName = pName;
        this.cDate = cDate;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public long getPid() {
        return pid;
    }

    public void setPid(long pid) {
        this.pid = pid;
    }

    public String getPName() {
        return pName;
    }

    public void setPName(String pName) {
        this.pName = pName;
    }

    public Date getCDate() {
        return cDate;
    }

    public void setCDate(Date cDate) {
        this.cDate = cDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cid != null ? cid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CdaCase)) {
            return false;
        }
        CdaCase other = (CdaCase) object;
        if ((this.cid == null && other.cid != null) || (this.cid != null && !this.cid.equals(other.cid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CdaCase[ cid=" + cid + " ]";
    }
    
}
