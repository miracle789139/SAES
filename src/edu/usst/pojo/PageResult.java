/**
 *
 */
package edu.usst.pojo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class PageResult extends BaseResult {
    private Integer pageNo;
    private Integer pageTotal;
    private Integer recordTotal;

    public Integer getPageNo() {
        return pageNo;
    }
    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageTotal() {return pageTotal;}
    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getRecordTotal() {return recordTotal;}
    public void setRecordTotal(Integer recordTotal) {
        this.recordTotal = recordTotal;
    }
}
