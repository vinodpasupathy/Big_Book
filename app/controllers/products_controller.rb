class ProductsController < ApplicationController

$nn=[]

require 'will_paginate/array'

 def home

     @product=Product.where(:parent_id=>nil)
   
 end

 def browser
 
     @product=Product.new
  
     respond_to do |format|
    
     format.html
    
     format.csv { send_data @product.to_csv }
    
     format.xls
  
     end
end

def homexls
    
    @aa=[]
  
    @aa << Product.where(:parent_id=>params[:product][:id]).pluck(:id)
  
    @aa.map do |o|
  
    o.map do |i|

    if Product.where(:parent_id=>i).present?
 
    @aa << Product.where(:parent_id=>i).pluck(:id)

    else

    $b=Mfrindex.where(:p_id=>i).only(:i_id).uniq

    end

    end

    end

    render :action=>"dd"
end

def hxls
    
    rr=Sku.where(:id=>params[:sku][:id])

    rrr=rr.mn.pluck(:value)[0]

    $b= Mfrindex.where(m_name:rrr).only(:i_id).uniq

    render :action=>"dd"

end

def dd

    @product=Product.all

end


 def login
 
     @admi=Admin.new

 end

 def login_process

     params.require(:email)
    
     params.require(:password)
     
     @admi=Admin.where params.permit(:email,:password)

     if not @admi.blank?

        session[:admi_id]=@admi.first.id

        flash[:notice] = "Successfully login..."

        redirect_to :action=>"browser"

      else

         flash[:notice] = "Invalid email/password combination" if params[:email] || params[:password]

         redirect_to :action => "login"
 
      end
 
 end 

 def logout
 
      session[:admi_id]=nil

      flash[:notice] = "Successfully logout..."

      redirect_to :action => "home"

 end

 def new_account

     @admi=Admin.new

 end

 def new_account_process
 
     @admi=Admin.new(admi_params)
    
     if @admi.save
    
        UserMailer.sign_up(@admi).deliver
    
        flash[:notice] = "Successfully create a new account..."

        redirect_to :action=>"browser"
  
     else
    
       redirect_to :action=>"new_account"
    
     end
 end


 def help_browser
 
     send_file Rails.root.join('public/files', 'sample.xls'), :type=>"application/xls", :x_sendfile=>true

 end
 
 def browser_process

     file=params[:product][:file1]

     filename=params[:product][:file1].original_filename

     @product=Product.browser(file)
    
     unless @product.blank?
    
     redirect_to :action=> "browser"
 
     flash[:notice] = "Your file has been successfully imported in a database..."
   
  else

     flash[:notice] = "Invalid file headers or file format"
     
     redirect_to :action=> "browser"
    
  end
 
 end

 
def search_edit
  
    $t=nil
   
    @taxo7=[]
   
    @sku=params[:format]

    @sku2=Sku.where(:i_id=>@sku)
         
    @img=(@sku2.imma).pluck(:value)[0]

    @ml=(@sku2.ml).pluck(:value)[0]
   
    @sku1=@sku2.att
 
    @sku3=@sku2.glo

    @sku4=@sku2.ex
 
    @sku5=@sku2.des

    @sku6=@sku2.ht || @sku2.pd

    @sku7="#{@sku2.fb}".split("|")
    
    @check=@sku2.pluck(:i_id)[0]

    @rel1=Sku.where(:i_id=>params[:format]).pluck(:p_id)[0]

    @cat=Sku.where(:p_id=>@rel1).distinct(:i_id)
   
    @ta=Sku.where(:i_id=>params[:format]).pluck(:p_id)[0]

begin

    s=nil

    @tax=Product.where(:id=>@ta)

    tax1=Product.where(:id=>@ta).pluck(:parent_id)[0]
     
    @taxo7<<@tax

    @ta=@tax.pluck(:parent_id)[0]

end until tax1==s

    $cath1=[]

    @taxo7.select{|i| $cath1<<i.where(:parent_id=>nil).pluck(:cat_name)[0]}
end

def search_edit
  
    $t=nil
   
    @taxo7=[]
   
    @sku=params[:format]

    @sku2=Sku.where(:i_id=>@sku)
         
    @img=(@sku2.imma).pluck(:value)[0]

    @ml=(@sku2.ml).pluck(:value)[0]
   
    @sku1=@sku2.att
 
    @sku3=@sku2.glo

    @sku4=@sku2.ex
 
    @sku5=@sku2.des

    @sku6=@sku2.ht || @sku2.pd

    @sku7="#{@sku2.where(:name=>'Feature Bullet').pluck(:value)[0]}".split("|")
    
    @check=@sku2.pluck(:i_id)[0]

    @rel1=Sku.where(:i_id=>params[:format]).pluck(:p_id)[0]

    @cat=Sku.where(:p_id=>@rel1).distinct(:i_id)
   
    @ta=Sku.where(:i_id=>params[:format]).pluck(:p_id)[0]

begin

    s=nil

    @tax=Product.where(:id=>@ta)

    tax1=Product.where(:id=>@ta).pluck(:parent_id)[0]
     
    @taxo7<<@tax

    @ta=@tax.pluck(:parent_id)[0]

end until tax1==s

    $cath1=[]

    @taxo7.select{|i| $cath1<<i.where(:parent_id=>nil).pluck(:cat_name)[0]}
end

def compare

    @cc=params[:is]

    @dd1,@dd2,@dd3=[],[],[]
 
    @cc.each do |i|

    @dd1<<(Sku.where(:i_id=>i).att).pluck(:name)

    @dd2<<(Sku.where(:i_id=>i).glo).pluck(:name)

    @dd3<<(Sku.where(:i_id=>i).imma).pluck(:name)
        
    end

    @n=[@dd2+@dd3+["IMAGE Link-1"]+@dd1].flatten.uniq

end

def manu_index_compare
 
    @cc=params[:is]

    @dd1,@dd2,@dd3=[],[],[]
 
    @cc.each do |i|

    @dd1<<(Sku.where(:i_id=>i).att).pluck(:name)

    @dd2<<(Sku.where(:i_id=>i).glo).pluck(:name)

    @dd3<<(Sku.where(:i_id=>i).imma).pluck(:name)
        
    end

    @n=[@dd2+@dd3+["IMAGE Link-1"]+@dd1].flatten.uniq

end

def manu_compare
  
    @cc=params[:is]

    @dd1,@dd2,@dd3=[],[],[]
 
    @cc.each do |i|

      @dd1<<(Sku.where(:i_id=>i).att).pluck(:name)
     
      @dd2<<(Sku.where(:i_id=>i).glo).pluck(:name)
     
      @dd3<<(Sku.where(:i_id=>i).imma).pluck(:name)
        
    end

    @n=[@dd2+@dd3+["IMAGE Link-1"]+@dd1].flatten.uniq
end

def manu_cate

    @productm=Product.where(parent_id:nil).order("cat_name ASC")
  
end

def manu_index



 $root=Product.where(:id=>params[:product_id]).pluck(:cat_name)[0]
$root1=Product.where(:id=>params[:product_id])
 mfr1=[]
 @@mfr2=[]
 mfr=Mfrindex.all.to_a#select(:taxonomy)
 mfr.each do |i| 
  
  @c=i.taxonomy.split('>')[0]
  if $root==@c
    @@mfr2<<i.p_id

  mfr1<<i.m_name
  
 end
 
 end
@mfr=mfr1.uniq

end
def result1

   @nn1=[]
 
   $param2=params[:search]
 
   @param=(params[:search])
 
   $skuu=Sku.where(:value=>/.*#{@param}*./i)
 
   $skuu.each do |i|
  
     @nn1 << i.i_id
 
   end

   n11= @nn1&@nn1

   if $nn.blank?

      $nn << n11

   else
  
      $nn.clear
  
      $nn << n11
   
   end

      redirect_to :action=>"result"
end

def result

   @kk1=$nn
 
   @kk2=@kk1.flatten

   $ssk=@kk2.paginate(:page => params[:page], :per_page => 10)
 
end




def manu

    $tax=[]

    @taxo1=[]

    @taxo2=[]

    $taxo12=[]

    if Sku.mn.where(:value=>params[:format]).any? 

      $h=Sku.mn.where(:value=>params[:format]).pluck(:value)[0]
    
      @sk1=Sku.where(:value=>params[:format]).distinct(:p_id)
    
      @sk2=@sk1.map{|i| Product.where(:id=>i)}
    
      @sk1.each do|i|
        
        @ta=i
    
        loop do
          
          @tax=Product.where(:id=>@ta)

          @ta=@tax.pluck(:parent_id)[0]
    
          $tax<<@tax.pluck(:id)[0]
    
          break if @ta==nil
    
        end 
    
      end
      
      @taxo1=$tax.uniq.map{|i| Product.where(:id=>i)}.flatten.sort
      
      @tt=@taxo1.select{|i| i.parent_id==nil}
      
      $tax1=@taxo1
      
    else 
  
      unless Product.where(:parent_id=>params[:format]).present?

      if params[:is].class == Array

          @pkk2=params[:is].uniq.collect{|i| Sku.where(:i_id=>i).where(:value=>$h).pluck(:i_id)}.uniq

          @ii=params[:format]

          @pkk3=@pkk2.paginate(:page => params[:page], :per_page => 10)

      else
 
          @ii=params[:format]
 
          @i=params[:format]
 
          @pkk1=Sku.where(:p_id=>@i).where(:value=>$h)
 
          @pkk2=@pkk1.distinct(:i_id)
 
          @pkk3=@pkk2.paginate(:page => params[:page], :per_page => 10)
 
     end
 
    else
       
          @ii=params[:format]
 
          @nn=Product.where(:id=>params[:format].to_s).pluck(:cat_name)[0]

          $taxo=$tax1
 
          $taxo.each do|i|

            if i.parent_id==params[:format].to_i
 
                @taxo1<<i
 
            end

          end 
  
  end
    
          $taxo=@taxo1
      
        begin
    
          s=nil
     
          @tax1=Product.where(:id=>@ii)

          tax1=Product.where(:id=>@ii).pluck(:parent_id)[0]
     
          $taxo12<<@tax1

         @ii=@tax1.pluck(:parent_id)[0]

        end until tax1==s

  end 
  
end

def manu1

  $taxo=[]

a="#{params[:format]}".split("/")

if a.count==2
$manufacture=a[1]

@par=a[0]
else
  @par=a[0]
end
@c=[]
 @par1=Mfrindex.where(:m_name=>$manufacture)
 @par1.each{|i|  @c<<i.taxonomy.split('>')}
   
unless Product.where(:parent_id=>@par).present?
  
   if Sku.where(:p_id => @par).where(:value => $manufacture).present?
   if params[:is].is_a? Array
@product1=params[:is].uniq
      @ta=@par

         
         @product3=@product1.paginate(:page => params[:page], :per_page => 10)

else
      @product1=Sku.where(:p_id=>@par).distinct(:i_id)
      @ta=@par

         
         @product3=@product1.paginate(:page => params[:page], :per_page => 10)

end
    end

 else 

  @r=Product.where(:parent_id=>@par).pluck(:cat_name)
@c.each do |i|  
  @kk=i
  @r.each do |j|
  

    if @kk.include?(j)

       @product1=Product.where(:parent_id=>@par).where(:cat_name=>"#{j}")

       @ta=@product1.map{|i| i.parent_id}[0]
       
    end

   end
  end


end
begin
    s=nil
     @tax=Product.where(:id=>@ta)

     tax1=Product.where(:id=>@ta).pluck(:parent_id)[0]
     
 $taxo<<@tax

 @ta=@tax.pluck(:parent_id)[0]

end until tax1==s

 end

def manu_desc
@sh=Sku.where(:p_id=>params[:id])
@sh1=@sh.mn



end



 def dest2
    sku=params[:product_id]
    @sku1=Sku.where(:i_id=>sku)
   
 end

  
 def aboutus
 @product=Product.new
 end
 def set_page
      @product = Product.find(params[:id])

    end

 private

 def product_params

   params.require(:product).permit!

 end

 def admi_params
  params.require(:email)
     params.require(:password)
     params.require(:re_enterpassword)
    params.permit(:email,:password,:re_enterpassword)
 end
end
