package com.coding.budgetingapp.security;


import java.util.Set;
import org.springframework.security.core.userdetails.UserDetails;
import com.coding.budgetingapp.domain.Authority;
import com.coding.budgetingapp.domain.User;

public class SecutiryUser extends User implements UserDetails {

	
	private static final long serialVersionUID = 1L;
	
    //public SecutiryUser() {}
    
	public SecutiryUser(User user) {
		this.setAuthorities(user.getAuthorities());
		this.setBudgets(user.getBudgets());
		this.setId(user.getId());
		this.setPassword(user.getPassword());
		this.setUsername(user.getUsername());
		
	}

	@Override
	public Set<Authority> getAuthorities(){
		return super.getAuthorities();
	}

	@Override
	public String getPassword() {
		return super.getPassword();
	}
	
	@Override
	public String getUsername() {
		return super.getUsername();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
}
