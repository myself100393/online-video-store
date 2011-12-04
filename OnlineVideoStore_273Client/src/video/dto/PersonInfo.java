/**
 * PersonInfo.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package video.dto;

public class PersonInfo  implements java.io.Serializable {
    private video.dto.Movie[] listActualRentMovie;

    private video.dto.Movie[] listRentMovie;

    private video.dto.Person person;

    public PersonInfo() {
    }

    public PersonInfo(
           video.dto.Movie[] listActualRentMovie,
           video.dto.Movie[] listRentMovie,
           video.dto.Person person) {
           this.listActualRentMovie = listActualRentMovie;
           this.listRentMovie = listRentMovie;
           this.person = person;
    }


    /**
     * Gets the listActualRentMovie value for this PersonInfo.
     * 
     * @return listActualRentMovie
     */
    public video.dto.Movie[] getListActualRentMovie() {
        return listActualRentMovie;
    }


    /**
     * Sets the listActualRentMovie value for this PersonInfo.
     * 
     * @param listActualRentMovie
     */
    public void setListActualRentMovie(video.dto.Movie[] listActualRentMovie) {
        this.listActualRentMovie = listActualRentMovie;
    }


    /**
     * Gets the listRentMovie value for this PersonInfo.
     * 
     * @return listRentMovie
     */
    public video.dto.Movie[] getListRentMovie() {
        return listRentMovie;
    }


    /**
     * Sets the listRentMovie value for this PersonInfo.
     * 
     * @param listRentMovie
     */
    public void setListRentMovie(video.dto.Movie[] listRentMovie) {
        this.listRentMovie = listRentMovie;
    }


    /**
     * Gets the person value for this PersonInfo.
     * 
     * @return person
     */
    public video.dto.Person getPerson() {
        return person;
    }


    /**
     * Sets the person value for this PersonInfo.
     * 
     * @param person
     */
    public void setPerson(video.dto.Person person) {
        this.person = person;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PersonInfo)) return false;
        PersonInfo other = (PersonInfo) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.listActualRentMovie==null && other.getListActualRentMovie()==null) || 
             (this.listActualRentMovie!=null &&
              java.util.Arrays.equals(this.listActualRentMovie, other.getListActualRentMovie()))) &&
            ((this.listRentMovie==null && other.getListRentMovie()==null) || 
             (this.listRentMovie!=null &&
              java.util.Arrays.equals(this.listRentMovie, other.getListRentMovie()))) &&
            ((this.person==null && other.getPerson()==null) || 
             (this.person!=null &&
              this.person.equals(other.getPerson())));
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
        if (getListActualRentMovie() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListActualRentMovie());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListActualRentMovie(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getListRentMovie() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListRentMovie());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListRentMovie(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getPerson() != null) {
            _hashCode += getPerson().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(PersonInfo.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://dto.video", "PersonInfo"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listActualRentMovie");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "listActualRentMovie"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Movie"));
        elemField.setNillable(true);
        elemField.setItemQName(new javax.xml.namespace.QName("http://connection.video", "item"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listRentMovie");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "listRentMovie"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Movie"));
        elemField.setNillable(true);
        elemField.setItemQName(new javax.xml.namespace.QName("http://connection.video", "item"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("person");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "person"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Person"));
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
