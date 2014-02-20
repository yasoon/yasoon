<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 11/02/14
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

error_reporting(E_ALL);

/**
 * @DI\Service("yasoon.service.allf")
 */
class AllfService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @param array $data
     * @return array
     */
    public function indexistoQueryAdd($data) {
        $api_url = 'http://api.indexisto.com';
        $api_version = '/1.0';
        $document = '/document';
        $indexid = '/52f4b86e273ed3396a6c05fb';
        $secret = 'apisearch';
        $type = '/default';
        
        $request_body = '{"_id" : "'.$data['id'].'",
            "_image" : "",
            "_url" : "'.$data['url'].'",
            "_subtype" : "'.$data['subtype'].'",
            "_sumtext" : "'.$data['sumtext'].'", 
            "tags" : ['.$data['tags'].'],
            "body" : "'.$data['body'].'",
            "date" : "'.$data['date'].'", 
            "title": "'.$data['title'].'"}';
            	
            	// remove tabs and linebreaks
            	$request_body = str_replace(array("\n", "\t", "\r"), "", $request_body);
            	
            	$api_uri = $api_version.$document.$indexid.$type;
            	$code = md5($api_uri.$request_body.$secret);
            	
            	$curl = curl_init();
            	curl_setopt($curl, CURLOPT_URL, $api_url.$api_uri.'?code='.$code.'');
            	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            	curl_setopt($curl, CURLOPT_POST, true);
            	curl_setopt($curl, CURLOPT_POSTFIELDS, $request_body);
            	$out = curl_exec($curl);
            	//echo $out.'<hr>';
            	curl_close($curl);
                
    }
    
    public function indexistoQueryDelete($data)
    {
        $api_url = 'http://api.indexisto.com';
        $api_version = '/1.0';
        $document = '/document';
        $indexid = '52f4b86e273ed3396a6c05fb';
        $secret = 'apisearch';
        $type = 'default';
        
        // Generate request url.
    	$request_url = $api_url . $api_version . '/document/' . $indexid . '/' . $type;
    
    	// Url for sign
    	$sign_url = $api_version . '/document/' . $indexid . '/' . $type;
    
    	// Generate key for sending data.
    	$code = md5($sign_url . $data . $secret);
    
    	$ch = curl_init($request_url . '?code=' . $code);                                                                      
    	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');                                                                     
    	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);                                                                  
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
    	curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
    	    'Content-Type: application/json',                                                                                
    	    'Content-Length: ' . strlen($data))                                                                       
    	);
    	$response = curl_exec($ch);
    	//return $response;
    }
}