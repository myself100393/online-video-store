/**
 * Bill.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package video.dto;

public class Bill  implements java.io.Serializable {
    private int month;

    private double monthlySubscription;

    private int outstandingMovie;

    private video.dto.PersonInfo personInfo;

    public Bill() {
    }

    public Bill(
           int month,
           double monthlySubscription,
           int outstandingMovie,
           video.dto.PersonInfo personInfo) {
           this.month = month;
           this.monthlySubscription = monthlySubscription;
           this.outstandingMovie = outstandingMovie;
           this.personInfo = personInfo;
    }


    /**
     * Gets the month value for this Bill.
     * 
     * @return month
     */
    public int getMonth() {
        return month;
    }


    /**
     * Sets the month value for this Bill.
     * 
     * @param month
     */
    public void setMonth(int month) {
        this.month = month;
    }


    /**
     * Gets the monthlySubscription value for this Bill.
     * 
     * @return monthlySubscription
     */
    public double getMonthlySubscription() {
        return monthlySubscription;
    }


    /**
     * Sets the monthlySubscription value for this Bill.
     * 
     * @param monthlySubscription
     */
    public void setMonthlySubscription(double monthlySubscription) {
        this.monthlySubscription = monthlySubscription;
    }


    /**
     * Gets the outstandingMovie value for this Bill.
     * 
     * @return outstandingMovie
     */
    public int getOutstandingMovie() {
        return outstandingMovie;
    }


    /**
     * Sets the outstandingMovie value for this Bill.
     * 
     * @param outstandingMovie
     */
    public void setOutstandingMovie(int outstandingMovie) {
        this.outstandingMovie = outstandingMovie;
    }


    /**
     * Gets the personInfo value for this Bill.
     * 
     * @return personInfo
     */
    public video.dto.PersonInfo getPersonInfo() {
        return personInfo;
    }


    /**
     * Sets the personInfo value for this Bill.
     * 
     * @param personInfo
     */
    public void setPersonInfo(video.dto.PersonInfo personInfo) {
        this.personInfo = personInfo;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Bill)) return false;
        Bill other = (Bill) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.month == other.getMonth() &&
            this.monthlySubscription == other.getMonthlySubscription() &&
            this.outstandingMovie == other.getOutstandingMovie() &&
            ((this.personInfo==null && other.getPersonInfo()==null) || 
             (this.personInfo!=null &&
              this.personInfo.equals(other.getPersonInfo())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        _hashCode += getMonth();
        _hashCode += new Double(getMonthlySubscription()).hashCode();
        _hashCode += getOutstandingMovie();
        if (getPersonInfo() != null) {
            _hashCode += getPersonInfo().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Bill.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Bill"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("month");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "month"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("monthlySubscription");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "monthlySubscription"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("outstandingMovie");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "outstandingMovie"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("personInfo");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "personInfo"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "PersonInfo"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
