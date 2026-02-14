package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {

	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBook();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllNewBook();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getUserOldBooks(String email);
	
	public boolean userBookDelete(String email, int bid);

	public List<BookDtls> getBookBySearch(String ch);
	
	
}

