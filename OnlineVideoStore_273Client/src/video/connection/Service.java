/**
 * Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package video.connection;

public interface Service extends java.rmi.Remote {
    public video.dto.Address getAddress(int userId) throws java.rmi.RemoteException;
    public boolean isUsernameExisted(java.lang.String username) throws java.rmi.RemoteException;
    public video.dto.PersonInfo displayPerson(int personId) throws java.rmi.RemoteException;
    public java.lang.String updatePersonAccount(video.dto.Person person, video.dto.Account account, video.dto.Address address) throws java.rmi.RemoteException;
    public java.lang.String logon(java.lang.String username, java.lang.String pwd) throws java.rmi.RemoteException;
    public video.dto.Person getPerson(java.lang.String username) throws java.rmi.RemoteException;
    public video.dto.Bill generateBill(int personId, int month, int year) throws java.rmi.RemoteException;
    public video.dto.Account getAccount(int userId) throws java.rmi.RemoteException;
    public java.lang.String deletePerson(int personId) throws java.rmi.RemoteException;
    public video.dto.Person[] find_Persons(int id, java.lang.String firstName, java.lang.String lastName, java.lang.String username, java.util.Calendar registration, java.util.Calendar last_Login) throws java.rmi.RemoteException;
    public video.dto.MovieInfo displayMovie(int movieId) throws java.rmi.RemoteException;
    public video.dto.Movie[] findMovies(int id, java.lang.String name, java.lang.String banner, java.util.Calendar release, double rentalPrice, int category, boolean isAvailable) throws java.rmi.RemoteException;
    public java.lang.String issueMovie(int movieId, int personId) throws java.rmi.RemoteException;
    public video.dto.Movie[] listMovies() throws java.rmi.RemoteException;
    public java.lang.String deleteMovie(java.lang.String movieId) throws java.rmi.RemoteException;
    public java.lang.String submitMovie(int movieId, int personId) throws java.rmi.RemoteException;
    public java.lang.String addMovie(video.dto.Movie movie) throws java.rmi.RemoteException;
    public java.lang.String updateMovie(video.dto.Movie movie) throws java.rmi.RemoteException;
    public java.lang.String signUp(video.dto.Person person, int accountType) throws java.rmi.RemoteException;
    public java.lang.String logout(int userId) throws java.rmi.RemoteException;
    public video.dto.Person[] listSimpleMember() throws java.rmi.RemoteException;
    public video.dto.Person[] listAllPersons() throws java.rmi.RemoteException;
    public video.dto.Person[] listPremiumMember() throws java.rmi.RemoteException;
}
