package video.dto;

import java.io.*;

 /**
  * This class is value object representing database table 'address'
  * This class is intended to be used together with associated AddressDao object.
  */

public class Address implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 4568991986331151737L;
	/** 
     * This data is directly mapped to the DB address table.
     */
    private int id;
    private int personId;
    private String street;
    private String city;
    private String state;
    private String country;
    private String zip;
 

    public Address () {
    	
         String street="";
         String city="";
         String state="";
         String country="";
         String zip="";

    }

	public Address(String street, String city, String state, String country, String zip) {
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zip = zip;
	}


    /** 
     * Get- and Set-methods
     */

    public int getId() {
          return this.id;
    }
    public void setId(int idIn) {
          this.id = idIn;
    }

    public int getPersonId() {
          return this.personId;
    }
    public void setPersonId(int personIdIn) {
          this.personId = personIdIn;
    }

    public String getStreet() {
          return this.street;
    }
    public void setStreet(String streetIn) {
          this.street = streetIn;
    }

    public String getCity() {
          return this.city;
    }
    public void setCity(String cityIn) {
          this.city = cityIn;
    }

    public String getState() {
          return this.state;
    }
    public void setState(String stateIn) {
          this.state = stateIn;
    }

    public String getCountry() {
          return this.country;
    }
    public void setCountry(String countryIn) {
          this.country = countryIn;
    }

    public String getZip() {
          return this.zip;
    }
    public void setZip(String zipIn) {
          this.zip = zipIn;
    }
 

    /** 
     * hasEqualMapping-method will compare two Address instances
     * and return true if they contain same values in all persistent instance 
     * variables. If hasEqualMapping returns true, it does not mean the objects
     * are the same instance. However it does mean that in that moment, they 
     * are mapped to the same row in database.
     */
    public boolean hasEqualMapping(Address valueObject) {

          if (valueObject.getId() != this.id) {
                    return(false);
          }
          if (valueObject.getPersonId() != this.personId) {
                    return(false);
          }
          if (this.street == null) {
                    if (valueObject.getStreet() != null)
                           return(false);
          } else if (!this.street.equals(valueObject.getStreet())) {
                    return(false);
          }
          if (this.city == null) {
                    if (valueObject.getCity() != null)
                           return(false);
          } else if (!this.city.equals(valueObject.getCity())) {
                    return(false);
          }
          if (this.state == null) {
                    if (valueObject.getState() != null)
                           return(false);
          } else if (!this.state.equals(valueObject.getState())) {
                    return(false);
          }
          if (this.country == null) {
                    if (valueObject.getCountry() != null)
                           return(false);
          } else if (!this.country.equals(valueObject.getCountry())) {
                    return(false);
          }
          if (this.zip == null) {
                    if (valueObject.getZip() != null)
                           return(false);
          } else if (!this.zip.equals(valueObject.getZip())) {
                    return(false);
          }

          return true;
    }



    /**
     * toString will return String object representing the state of this 
     * valueObject. This is useful during application development, and 
     * possibly when application is writing object states in textlog.
     */
    public String toString() {
        StringBuffer out = new StringBuffer();
        out.append("\nclass Address, mapping to table address\n");
        out.append("Persistent attributes: \n"); 
        out.append("id = " + this.id + "\n"); 
        out.append("personId = " + this.personId + "\n"); 
        out.append("street = " + this.street + "\n"); 
        out.append("city = " + this.city + "\n"); 
        out.append("state = " + this.state + "\n"); 
        out.append("country = " + this.country + "\n"); 
        out.append("zip = " + this.zip + "\n"); 
        return out.toString();
    }

 

}

