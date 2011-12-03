/**
 * Movie.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package video.dto;

public class Movie  implements java.io.Serializable {
    private java.lang.String banner;

    private int id;

    private java.lang.String name;

    private int nbAvailable;

    private java.util.Calendar releaseDate;

    private double rentAmount;

    public Movie() {
    }

    public Movie(
           java.lang.String banner,
           int id,
           java.lang.String name,
           int nbAvailable,
           java.util.Calendar releaseDate,
           double rentAmount) {
           this.banner = banner;
           this.id = id;
           this.name = name;
           this.nbAvailable = nbAvailable;
           this.releaseDate = releaseDate;
           this.rentAmount = rentAmount;
    }


    /**
     * Gets the banner value for this Movie.
     * 
     * @return banner
     */
    public java.lang.String getBanner() {
        return banner;
    }


    /**
     * Sets the banner value for this Movie.
     * 
     * @param banner
     */
    public void setBanner(java.lang.String banner) {
        this.banner = banner;
    }


    /**
     * Gets the id value for this Movie.
     * 
     * @return id
     */
    public int getId() {
        return id;
    }


    /**
     * Sets the id value for this Movie.
     * 
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }


    /**
     * Gets the name value for this Movie.
     * 
     * @return name
     */
    public java.lang.String getName() {
        return name;
    }


    /**
     * Sets the name value for this Movie.
     * 
     * @param name
     */
    public void setName(java.lang.String name) {
        this.name = name;
    }


    /**
     * Gets the nbAvailable value for this Movie.
     * 
     * @return nbAvailable
     */
    public int getNbAvailable() {
        return nbAvailable;
    }


    /**
     * Sets the nbAvailable value for this Movie.
     * 
     * @param nbAvailable
     */
    public void setNbAvailable(int nbAvailable) {
        this.nbAvailable = nbAvailable;
    }


    /**
     * Gets the releaseDate value for this Movie.
     * 
     * @return releaseDate
     */
    public java.util.Calendar getReleaseDate() {
        return releaseDate;
    }


    /**
     * Sets the releaseDate value for this Movie.
     * 
     * @param releaseDate
     */
    public void setReleaseDate(java.util.Calendar releaseDate) {
        this.releaseDate = releaseDate;
    }


    /**
     * Gets the rentAmount value for this Movie.
     * 
     * @return rentAmount
     */
    public double getRentAmount() {
        return rentAmount;
    }


    /**
     * Sets the rentAmount value for this Movie.
     * 
     * @param rentAmount
     */
    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Movie)) return false;
        Movie other = (Movie) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.banner==null && other.getBanner()==null) || 
             (this.banner!=null &&
              this.banner.equals(other.getBanner()))) &&
            this.id == other.getId() &&
            ((this.name==null && other.getName()==null) || 
             (this.name!=null &&
              this.name.equals(other.getName()))) &&
            this.nbAvailable == other.getNbAvailable() &&
            ((this.releaseDate==null && other.getReleaseDate()==null) || 
             (this.releaseDate!=null &&
              this.releaseDate.equals(other.getReleaseDate()))) &&
            this.rentAmount == other.getRentAmount();
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
        if (getBanner() != null) {
            _hashCode += getBanner().hashCode();
        }
        _hashCode += getId();
        if (getName() != null) {
            _hashCode += getName().hashCode();
        }
        _hashCode += getNbAvailable();
        if (getReleaseDate() != null) {
            _hashCode += getReleaseDate().hashCode();
        }
        _hashCode += new Double(getRentAmount()).hashCode();
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Movie.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Movie"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("banner");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "banner"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("name");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "name"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nbAvailable");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "nbAvailable"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("releaseDate");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "releaseDate"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("rentAmount");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "rentAmount"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
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
