function rm --wraps=echo\ \"This\ is\ not\ the\ command\ you\ are\ looking\ for,\ try\ trp.\ \(If\ you\ really\ want\ it\ use\ \\rm\)\"\;\ false --description alias\ rm=echo\ \"This\ is\ not\ the\ command\ you\ are\ looking\ for,\ try\ trp.\ \(If\ you\ really\ want\ it\ use\ \\rm\)\"\;\ false
  echo "This is not the command you are looking for, try trp. (If you really want it use \rm)"; false $argv
        
end
