/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zappy.pmsys.beans;

import java.util.List;

/**
 *
 * @author Arun
 */
public class TeachingFaculty extends Faculty{
    private List<Experience> experience;
    private List<Industry> industry;
    private List<Qualification> qualification;
    private List<Responsibilities> responsibilities;
    private List<Monographs> monographs;
    private List<ProposalDetails> proposalDetails;
    private List<JournalDetails> journalDetails;
    private List<WorkshopSeminarDetails> workshopSeminarDetails;
    private List<OrganizedProgramDetails>  organizedProgramDetails;
    private List<AreaOfInterest> areaOfInterest;
    private List<MembershipDetails> membershipDetails;
    private List<HandledSubjects> handledSubjects; 

    public List<JournalDetails> getJournalDetails() {
        return journalDetails;
    }

    public void setJournalDetails(List<JournalDetails> journalDetails) {
        this.journalDetails = journalDetails;
    }

    public List<Experience> getExperience() {
        return experience;
    }

    public void setExperience(List<Experience> experience) {
        this.experience = experience;
    }

    public List<Industry> getIndustry() {
        return industry;
    }

    public void setIndustry(List<Industry> industry) {
        this.industry = industry;
    }

    public List<Qualification> getQualification() {
        return qualification;
    }

    public void setQualification(List<Qualification> qualification) {
        this.qualification = qualification;
    }

    public List<Responsibilities> getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(List<Responsibilities> responsibilities) {
        this.responsibilities = responsibilities;
    }

    public List<Monographs> getMonographs() {
        return monographs;
    }

    public void setMonographs(List<Monographs> monographs) {
        this.monographs = monographs;
    }

    public List<ProposalDetails> getProposalDetails() {
        return proposalDetails;
    }

    public void setProposalDetails(List<ProposalDetails> proposalDetails) {
        this.proposalDetails = proposalDetails;
    }

    public List<WorkshopSeminarDetails> getWorkshopSeminarDetails() {
        return workshopSeminarDetails;
    }

    public void setWorkshopSeminarDetails(List<WorkshopSeminarDetails> workshopSeminarDetails) {
        this.workshopSeminarDetails = workshopSeminarDetails;
    }

    public List<OrganizedProgramDetails> getOrganizedProgramDetails() {
        return organizedProgramDetails;
    }

    public void setOrganizedProgramDetails(List<OrganizedProgramDetails> organizedProgramDetails) {
        this.organizedProgramDetails = organizedProgramDetails;
    }

    public List<AreaOfInterest> getAreaOfInterest() {
        return areaOfInterest;
    }

    public void setAreaOfInterest(List<AreaOfInterest> areaOfInterest) {
        this.areaOfInterest = areaOfInterest;
    }

    public List<MembershipDetails> getMembershipDetails() {
        return membershipDetails;
    }

    public void setMembershipDetails(List<MembershipDetails> membershipDetails) {
        this.membershipDetails = membershipDetails;
    }

    public List<HandledSubjects> getHandledSubjects() {
        return handledSubjects;
    }

    public void setHandledSubjects(List<HandledSubjects> handledSubjects) {
        this.handledSubjects = handledSubjects;
    }
}
