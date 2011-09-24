>> ADODB Library for PHP4

(c) 2000-2002 John Lim (jlim@natsoft.com.my)

Released under both BSD and GNU Lesser GPL library license. 
This means you can use it in proprietary products.
 
 
>> Changes in the PostNuke Edition

/includes/drivers/adodb-mysql.inc.php 

-----
#	var $hasGenID = false;	// Fix for PostNuke Pablo Roca / larsneo / Neo
-----
#	function GenID($seqname='adodbseq',$startID=1)
#	{
#		// post-nuke sets hasGenID to false
#		// if (!$this->hasGenID) return false;
#		// temporal fix proca
#		if (!$this->hasGenID) return 0;
#		
#		$getnext = sprintf($this->_genIDSQL,$seqname);
#		$rs = @$this->Execute($getnext);
#		if (!$rs) {
#			$u = strtoupper($seqname);
#			$this->Execute(sprintf($this->_genSeqSQL,$seqname));
#			$this->Execute(sprintf($this->_genSeq2SQL,$seqname,$startID-1));
#			$rs = $this->Execute($getnext);
#		}
#		$this->genID = mysql_insert_id($this->_connectionID);
#		
#		if ($rs) $rs->Close();
#		
#		return $this->genID;
#	}
-----	

larsneo@postnuke.com