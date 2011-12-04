/**
 * MovieInfo.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package video.dto;

public class MovieInfo  implements java.io.Serializable {
    private video.dto.Person[] listPerson;

    private video.dto.Movie movie;

    public MovieInfo() {
    }

    public MovieInfo(
           video.dto.Person[] listPerson,
           video.dto.Movie movie) {
           this.listPerson = listPerson;
           this.movie = movie;
    }


    /**
     * Gets the listPerson value for this MovieInfo.
     * 
     * @return listPerson
     */
    public video.dto.Person[] getListPerson() {
        return listPerson;
    }


    /**
     * Sets the listPerson value for this MovieInfo.
     * 
     * @param listPerson
     */
    public void setListPerson(video.dto.Person[] listPerson) {
        this.listPerson = listPerson;
    }


    /**
     * Gets the movie value for this MovieInfo.
     * 
     * @return movie
     */
    public video.dto.Movie getMovie() {
        return movie;
    }


    /**
     * Sets the movie value for this MovieInfo.
     * 
     * @param movie
     */
    public void setMovie(video.dto.Movie movie) {
        this.movie = movie;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof MovieInfo)) return false;
        MovieInfo other = (MovieInfo) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.listPerson==null && other.getListPerson()==null) || 
             (this.listPerson!=null &&
              java.util.Arrays.equals(this.listPerson, other.getListPerson()))) &&
            ((this.movie==null && other.getMovie()==null) || 
             (this.movie!=null &&
              this.movie.equals(other.getMovie())));
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
        if (getListPerson() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getListPerson());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getListPerson(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getMovie() != null) {
            _hashCode += getMovie().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(MovieInfo.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://dto.video", "MovieInfo"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("listPerson");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "listPerson"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Person"));
        elemField.setNillable(true);
        elemField.setItemQName(new javax.xml.namespace.QName("http://connection.video", "item"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("movie");
        elemField.setXmlName(new javax.xml.namespace.QName("http://dto.video", "movie"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://dto.video", "Movie"));
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
