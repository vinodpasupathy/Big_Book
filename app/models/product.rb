class Product
  include Mongoid::Document
  field :cat_name, type: String
  field :parent_id, type: Integer
  require 'csv'
  has_many :skus
  embeds_many :skus
  index({ parent_id: 1},{ background: true })
  index({ cat_name: 1},{ background: true })
  index({ id: 1},{unique: true})
def self.browser(file)

  @file1=file.original_filename.split(".")
   if @file1[@file1.count-1] == "csv"
     ch1=["GD", "M Name", "M Logo", "M Number", "Name", "D Long", "D Short", "D Copy", "D Bullet","T","H1","I1","P1","A1"]
    
     f = CSV.read(file.tempfile) #|| f= CSV.read(file.tempfile, { :col_sep => "\t" })


      header=ch1.map{|i| f[0].include?(i)}
      if header.count(true)==ch1.count
    
         d=f[0].index("T")
         f[0].delete_at(d)
          fc=f[0].count-1
          ff=f[0].last(fc)

           mh =  ["Global Description", "Manufacturer Name", "Manufacturer Logo", "Manufacturer Part Number", "Product Name", "Long Description", "Short Description", "Feature Copy", "Feature Bullet"]  
           ch=["GD", "M Name", "M Logo", "M Number", "Name", "D Long", "D Short", "D Copy", "D Bullet"]
            gdl=ff.index(ch[0])
      
              mnl=ff.index(ch[1])
               mll=ff.index(ch[2])
                mpl=ff.index(ch[3])
               pnl=ff.index(ch[4])
               dl=ff.index{|i| i.start_with?("D")}
               hl=ff.index{|i| i.start_with?("H")}
              pl=ff.index{|i| i.start_with?("P")}
                il=ff.index{|i| i.start_with?("I")}
              mc = ff.select{|i| i.start_with?("M")}.count
               hc = ff.select{|i| i.start_with?("H")}.count
               pc = ff.select{|i| i.start_with?("P")}.count
                 dc = ff.select{|i| i.start_with?("D")}.count
                  ic = ff.select{|i| i.start_with?("I")}.count
                ec = ff.select{|i| i.start_with?("E")}.count
                ac = ff.select{|i| i.start_with?("A")}.count
                      trl = mc+hc+pc+dc+ic+ec+2

                    el=ff.index{|i| i.start_with?("E")}
                    unless el.blank?
                     eel=el+ec-1
                    eh=f[1][el+1..eel+1]
                  end
                   hel=hl+hc-1
                   pel=pl+pc-1
                  ddl=dl+dc-1
                    iel=il+ic-1
                      csv,@qx=[],[]
                f.each do|line|
                   next if line[0].match(/[0-9]/) == nil
             
                     mfn=line[mnl+1].capitalize.split.first(2)
                    mfn.delete("The")
                      @mfn=mfn[0].to_s.downcase
      
                     @mfpn="#{"#{line[mpl+1]}".gsub(/\W/,'')}".downcase
    
                      next if Mfrindex.where(:mn_dummy=>@mfn).where(:mpn_dummy=>@mfpn).present?
      
                         @ff1=line[d]
                         @ff="#{line[d]}".split(">")
     
                         s=nil
                       @ff.each do |k|
                          if Product.where(cat_name:s).present?
                                @a=Product.where(cat_name:s).pluck(:id)[0]
                          else
                              @a=nil
                          end
                            @c1= Product.where(:cat_name =>k)
        
                            unless (@c1.where(parent_id: @a)).any?
                                 product = Product.new(:cat_name=>k, :parent_id=>@a)
                                   product.save(:validate=>true)
                                
          
                            end
                            @c=Product.where(:cat_name=>k).pluck(:id)[0]
                            @qx<<@c
                           s=k
                       end
    
                      line.delete_at(d)

                        x = line ; id=x.shift
                        x1=x
                        x2 = x.pop(ac)

                         gd=x1[gdl]
      
                        mm=[x1[mnl],x1[mll],x1[mpl]]
    
                         pn=x1[pnl]
                         dd=x1[dl..ddl].compact
                            ht=x1[hl..hel].compact
                          pd=x1[pl..pel].compact
                         im=x1[il..iel].compact
                         hcc,pcc,icc=ht.count,pd.count,im.count
                          unless el.blank?
                          ex=x1[el..eel]
                          e4 =[eh,ex].transpose

                        end
                           g1=[mh[0],gd]
                             p3=[mh[4],pn]
                           m2 =[mh[1..3],mm].transpose.flatten
                             
                            d5 =[[mh[5],dd[0]],[mh[6],dd[1]],[mh[7],dd[2]],[mh[8],dd[3]]].reject{|i| i.include?(nil) }
                               hh,pp,ii=[],[],[];h,p,i=1,1,1
                             hcc.times do|m|
                                   hh<<"HTML Link-"+h.to_s
                                    h=h+1
                             end
                             pcc.times do|m|
                                  pp<<"PDF Link-"+p.to_s
                                    p=p+1
                             end
                             icc.times do|m|
                                  ii<<"IMAGE Link-"+i.to_s
                                     i=i+1
                             end
                              h6=hh,ht;p7=pp,pd;i8=ii,im
                                 adf=["Global","Extra","Description","HTML","PDF","IMAGE","Attributes"]
                               ht1 = h6.transpose.flat_map{|x| [adf[3],x]}.flatten
                                   pd2 = p7.transpose.flat_map{|x| [adf[4],x]}.flatten
                                    im3 = i8.transpose.flat_map{|x| [adf[5],x]}.flatten
                                      gh1 = (g1+m2+p3).each_slice(2).to_a.flat_map { |x| [adf[0],x] }.flatten
                                      eh2=[]
                                      unless el.blank?
                                        eh2 = e4.flat_map{|x| [adf[1],x]}.flatten 
                                      end
                                          dh3 = d5.flat_map{|x| [adf[2],x]}.flatten
                                       imo=[gh1,eh2,dh3,ht1,pd2,im3].flatten
                                   glo = imo.each_slice(3).to_a
                                att = x2.each_slice(3).to_a.flat_map{|x| [adf[6],x]}.flatten.each_slice(4).to_a.reject{|i| i[1] == nil}
                                           add = glo + att
                                          ad = add.reject{|i| i[2] == nil}
                              ad.each do|p|
                                     csv << [id] + [@c] + p
                                    
                                     sku=Sku.new(:i_id=>id,:c_name=>p[0],:name=>p[1],:value=>p[2],:unit=>p[3],:p_id=>@c)
                      sku.save(:validate=>false)
                    
                              end
                              @im=Sku.where(:i_id=>id).where(:c_name=>"IMAGE").pluck(:value)[0]
                              mfrindex=Mfrindex.new(:i_id=>id,:m_name=>line[mnl],:taxonomy=>@ff1,:mn_dummy=>@mfn,:mpn_dummy=>@mfpn,:p_id=>@c,:im=>@im,:tax=>@qx.uniq.sort)
                                 mfrindex.save(:validate=>false)
                       end
    
                      #csv.each do|i|
    
                      #sku=Sku.new(:i_id=>i[0],:c_name=>i[2],:name=>i[3],:value=>i[4],:unit=>i[5],:p_id=>i[1])
                      #sku.save(:validate=>false)

                #end
      end
  end 
end

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end
end