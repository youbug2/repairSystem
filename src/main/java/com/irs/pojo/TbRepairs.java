package com.irs.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class TbRepairs {
    private Long id;

    private Long adminId;

    private String adminName;

    private Integer formType;

    private String handlerName;

    private Long handlerId;

    private Integer status;

    private String linkman;

    private String tel;

    private String address;

    private String subject;

    private String content;

    private String linkUrl;

    private Timestamp createDate;

    private Timestamp modifyDate;

    private String replyContent;


    private String evaluation;

    private Integer starLevel;

    private Integer evaluateFlag;

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public Integer getStarLevel() {
        return starLevel;
    }

    public void setStarLevel(Integer starLevel) {
        this.starLevel = starLevel;
    }

    public Integer getEvaluateFlag() {
        return evaluateFlag;
    }

    public void setEvaluateFlag(Integer evaluateFlag) {
        this.evaluateFlag = evaluateFlag;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public Integer getFormType() {
        return formType;
    }

    public void setFormType(Integer formType) {
        this.formType = formType;
    }

    public String getHandlerName() {
        return handlerName;
    }

    public void setHandlerName(String handlerName) {
        this.handlerName = handlerName;
    }

    public Long getHandlerId() {
        return handlerId;
    }

    public void setHandlerId(Long handlerId) {
        this.handlerId = handlerId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    @Override
    public String toString() {
        return "TbRepairs{" +
                "id=" + id +
                ", adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", formType=" + formType +
                ", handlerName='" + handlerName + '\'' +
                ", handlerId=" + handlerId +
                ", status=" + status +
                ", linkman='" + linkman + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                ", createDate=" + createDate +
                ", modifyDate=" + modifyDate +
                ", replyContent='" + replyContent + '\'' +
                '}';
    }
}
