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
@Table(name = "cda_doctor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CdaDoctor.findAll", query = "SELECT c FROM CdaDoctor c"),
    @NamedQuery(name = "CdaDoctor.findByDoctorId", query = "SELECT c FROM CdaDoctor c WHERE c.doctorId = :doctorId"),
    @NamedQuery(name = "CdaDoctor.findByName", query = "SELECT c FROM CdaDoctor c WHERE c.name = :name"),
    @NamedQuery(name = "CdaDoctor.findByEmail", query = "SELECT c FROM CdaDoctor c WHERE c.email = :email"),
    @NamedQuery(name = "CdaDoctor.findByPassword", query = "SELECT c FROM CdaDoctor c WHERE c.password = :password"),
    @NamedQuery(name = "CdaDoctor.findByContact", query = "SELECT c FROM CdaDoctor c WHERE c.contact = :contact"),
    @NamedQuery(name = "CdaDoctor.findByAddress", query = "SELECT c FROM CdaDoctor c WHERE c.address = :address"),
    @NamedQuery(name = "CdaDoctor.findByPhoto", query = "SELECT c FROM CdaDoctor c WHERE c.photo = :photo"),
    @NamedQuery(name = "CdaDoctor.findByPracticeType", query = "SELECT c FROM CdaDoctor c WHERE c.practiceType = :practiceType"),
    @NamedQuery(name = "CdaDoctor.findByGrno", query = "SELECT c FROM CdaDoctor c WHERE c.grno = :grno")})
public class CdaDoctor implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "doctor_id")
    private Long doctorId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Column(name = "contact")
    private String contact;
    @Basic(optional = false)
    @Column(name = "address")
    private String address;
    @Column(name = "photo")
    private String photo;
    @Basic(optional = false)
    @Column(name = "practice_type")
    private String practiceType;
    @Basic(optional = false)
    @Column(name = "grno")
    private String grno;
    @Lob
    @Column(name = "freq_symptoms")
    private String freqSymptoms;

    public CdaDoctor() {
    }

    public CdaDoctor(Long doctorId) {
        this.doctorId = doctorId;
    }

    public CdaDoctor(Long doctorId, String name, String email, String password, String contact, String address, String practiceType, String grno) {
        this.doctorId = doctorId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.address = address;
        this.practiceType = practiceType;
        this.grno = grno;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPracticeType() {
        return practiceType;
    }

    public void setPracticeType(String practiceType) {
        this.practiceType = practiceType;
    }

    public String getGrno() {
        return grno;
    }

    public void setGrno(String grno) {
        this.grno = grno;
    }

    public String getFreqSymptoms() {
        return freqSymptoms;
    }

    public void setFreqSymptoms(String freqSymptoms) {
        this.freqSymptoms = freqSymptoms;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (doctorId != null ? doctorId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CdaDoctor)) {
            return false;
        }
        CdaDoctor other = (CdaDoctor) object;
        if ((this.doctorId == null && other.doctorId != null) || (this.doctorId != null && !this.doctorId.equals(other.doctorId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CdaDoctor[ doctorId=" + doctorId + " ]";
    }
    
}
