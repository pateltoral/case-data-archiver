/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "cda_patient")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CdaPatient.findAll", query = "SELECT c FROM CdaPatient c"),
    @NamedQuery(name = "CdaPatient.findById", query = "SELECT c FROM CdaPatient c WHERE c.id = :id"),
    @NamedQuery(name = "CdaPatient.findByPName", query = "SELECT c FROM CdaPatient c WHERE c.pName = :pName"),
    @NamedQuery(name = "CdaPatient.findByPAge", query = "SELECT c FROM CdaPatient c WHERE c.pAge = :pAge"),
    @NamedQuery(name = "CdaPatient.findByPGender", query = "SELECT c FROM CdaPatient c WHERE c.pGender = :pGender"),
    @NamedQuery(name = "CdaPatient.findByPEmail", query = "SELECT c FROM CdaPatient c WHERE c.pEmail = :pEmail"),
    @NamedQuery(name = "CdaPatient.findByPContact", query = "SELECT c FROM CdaPatient c WHERE c.pContact = :pContact"),
    @NamedQuery(name = "CdaPatient.findByPOccupation", query = "SELECT c FROM CdaPatient c WHERE c.pOccupation = :pOccupation"),
    @NamedQuery(name = "CdaPatient.findByPBloodgroup", query = "SELECT c FROM CdaPatient c WHERE c.pBloodgroup = :pBloodgroup")})
public class CdaPatient implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "p_name")
    private String pName;
    @Column(name = "p_age")
    private String pAge;
    @Basic(optional = false)
    @Column(name = "p_gender")
    private String pGender;
    @Basic(optional = false)
    @Lob
    @Column(name = "p_address")
    private String pAddress;
    @Column(name = "p_email")
    private String pEmail;
    @Column(name = "p_contact")
    private String pContact;
    @Column(name = "p_occupation")
    private String pOccupation;
    @Column(name = "p_bloodgroup")
    private String pBloodgroup;

    public CdaPatient() {
    }

    public CdaPatient(Long id) {
        this.id = id;
    }

    public CdaPatient(Long id, String pName, String pGender, String pAddress) {
        this.id = id;
        this.pName = pName;
        this.pGender = pGender;
        this.pAddress = pAddress;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPName() {
        return pName;
    }

    public void setPName(String pName) {
        this.pName = pName;
    }

    public String getPAge() {
        return pAge;
    }

    public void setPAge(String pAge) {
        this.pAge = pAge;
    }

    public String getPGender() {
        return pGender;
    }

    public void setPGender(String pGender) {
        this.pGender = pGender;
    }

    public String getPAddress() {
        return pAddress;
    }

    public void setPAddress(String pAddress) {
        this.pAddress = pAddress;
    }

    public String getPEmail() {
        return pEmail;
    }

    public void setPEmail(String pEmail) {
        this.pEmail = pEmail;
    }

    public String getPContact() {
        return pContact;
    }

    public void setPContact(String pContact) {
        this.pContact = pContact;
    }

    public String getPOccupation() {
        return pOccupation;
    }

    public void setPOccupation(String pOccupation) {
        this.pOccupation = pOccupation;
    }

    public String getPBloodgroup() {
        return pBloodgroup;
    }

    public void setPBloodgroup(String pBloodgroup) {
        this.pBloodgroup = pBloodgroup;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CdaPatient)) {
            return false;
        }
        CdaPatient other = (CdaPatient) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CdaPatient[ id=" + id + " ]";
    }
    
}
