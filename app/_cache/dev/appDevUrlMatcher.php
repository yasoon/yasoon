<?php

use Symfony\Component\Routing\Exception\MethodNotAllowedException;
use Symfony\Component\Routing\Exception\ResourceNotFoundException;
use Symfony\Component\Routing\RequestContext;

/**
 * appDevUrlMatcher
 *
 * This class has been auto-generated
 * by the Symfony Routing Component.
 */
class appDevUrlMatcher extends Symfony\Bundle\FrameworkBundle\Routing\RedirectableUrlMatcher
{
    /**
     * Constructor.
     */
    public function __construct(RequestContext $context)
    {
        $this->context = $context;
    }

    public function match($pathinfo)
    {
        $allow = array();
        $pathinfo = rawurldecode($pathinfo);

        if (0 === strpos($pathinfo, '/a')) {
            if (0 === strpos($pathinfo, '/admin')) {
                // yasoon_site_admin_index
                if (rtrim($pathinfo, '/') === '/admin') {
                    if (substr($pathinfo, -1) !== '/') {
                        return $this->redirect($pathinfo.'/', 'yasoon_site_admin_index');
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AdminController::indexAction',  '_route' => 'yasoon_site_admin_index',);
                }

                // yasoon_site_admin_getusers
                if (0 === strpos($pathinfo, '/admin/getUsers') && preg_match('#^/admin/getUsers/(?P<page>[^/]++)/(?P<items>[^/]++)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_admin_getusers;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_admin_getusers')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AdminController::getUsers',));
                }
                not_yasoon_site_admin_getusers:

                // yasoon_site_admin_deleteuser
                if ($pathinfo === '/admin/deleteUser') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_admin_deleteuser;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AdminController::deleteUser',  '_route' => 'yasoon_site_admin_deleteuser',);
                }
                not_yasoon_site_admin_deleteuser:

                // yasoon_site_admin_get_posts
                if (0 === strpos($pathinfo, '/admin/get_posts') && preg_match('#^/admin/get_posts/(?P<page>[^/]++)/(?P<items>[^/]++)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_admin_get_posts;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_admin_get_posts')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AdminController::get_posts',));
                }
                not_yasoon_site_admin_get_posts:

                // yasoon_site_admin_deleteinterview
                if ($pathinfo === '/admin/deleteInterview') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_admin_deleteinterview;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AdminController::deleteInterview',  '_route' => 'yasoon_site_admin_deleteinterview',);
                }
                not_yasoon_site_admin_deleteinterview:

            }

            if (0 === strpos($pathinfo, '/api')) {
                if (0 === strpos($pathinfo, '/api/answer')) {
                    // yasoon_site_answer_add
                    if ($pathinfo === '/api/answer/add') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_answer_add;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AnswerController::addAction',  '_route' => 'yasoon_site_answer_add',);
                    }
                    not_yasoon_site_answer_add:

                    // yasoon_site_answer_update
                    if ($pathinfo === '/api/answer/update') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_answer_update;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AnswerController::updateAction',  '_route' => 'yasoon_site_answer_update',);
                    }
                    not_yasoon_site_answer_update:

                    // yasoon_site_answer_remove
                    if ($pathinfo === '/api/answer/delete') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_answer_remove;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AnswerController::removeAction',  '_route' => 'yasoon_site_answer_remove',);
                    }
                    not_yasoon_site_answer_remove:

                }

                if (0 === strpos($pathinfo, '/api/search')) {
                    // yasoon_site_apisearch_get
                    if ($pathinfo === '/api/search/get') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_apisearch_get;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ApiSearchController::get',  '_route' => 'yasoon_site_apisearch_get',);
                    }
                    not_yasoon_site_apisearch_get:

                    // yasoon_site_apisearch_test
                    if ($pathinfo === '/api/search/test') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_apisearch_test;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ApiSearchController::test',  '_route' => 'yasoon_site_apisearch_test',);
                    }
                    not_yasoon_site_apisearch_test:

                    // yasoon_site_apisearch_actiontest
                    if ($pathinfo === '/api/search/actiontest') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_apisearch_actiontest;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ApiSearchController::actiontest',  '_route' => 'yasoon_site_apisearch_actiontest',);
                    }
                    not_yasoon_site_apisearch_actiontest:

                }

            }

        }

        if (0 === strpos($pathinfo, '/log')) {
            if (0 === strpos($pathinfo, '/login')) {
                // login_check
                if ($pathinfo === '/login_check') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_login_check;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::loginCheckAction',  '_route' => 'login_check',);
                }
                not_login_check:

                // login
                if ($pathinfo === '/login') {
                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::loginAction',  '_route' => 'login',);
                }

            }

            // logout
            if ($pathinfo === '/logout') {
                return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::logoutAction',  '_route' => 'logout',);
            }

            if (0 === strpos($pathinfo, '/login/fa')) {
                // loginfail
                if ($pathinfo === '/login/fail') {
                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::fail',  '_route' => 'loginfail',);
                }

                if (0 === strpos($pathinfo, '/login/facebook')) {
                    // loginfacebook
                    if ($pathinfo === '/login/facebook') {
                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::login_facebook',  '_route' => 'loginfacebook',);
                    }

                    // loginfacebookfail
                    if ($pathinfo === '/login/facebook/fail') {
                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthController::login_facebook_fail',  '_route' => 'loginfacebookfail',);
                    }

                }

            }

        }

        if (0 === strpos($pathinfo, '/api')) {
            if (0 === strpos($pathinfo, '/api/author')) {
                if (0 === strpos($pathinfo, '/api/author/s')) {
                    if (0 === strpos($pathinfo, '/api/author/set')) {
                        // yasoon_site_author_setfriends
                        if ($pathinfo === '/api/author/setFriends') {
                            if ($this->context->getMethod() != 'POST') {
                                $allow[] = 'POST';
                                goto not_yasoon_site_author_setfriends;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::setFriends',  '_route' => 'yasoon_site_author_setfriends',);
                        }
                        not_yasoon_site_author_setfriends:

                        // yasoon_site_author_setquestion
                        if ($pathinfo === '/api/author/setQuestion') {
                            if ($this->context->getMethod() != 'POST') {
                                $allow[] = 'POST';
                                goto not_yasoon_site_author_setquestion;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::setQuestion',  '_route' => 'yasoon_site_author_setquestion',);
                        }
                        not_yasoon_site_author_setquestion:

                    }

                    // yasoon_site_author_savequestionanswer
                    if ($pathinfo === '/api/author/saveQuestionAnswer') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_author_savequestionanswer;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::saveQuestionAnswer',  '_route' => 'yasoon_site_author_savequestionanswer',);
                    }
                    not_yasoon_site_author_savequestionanswer:

                }

                if (0 === strpos($pathinfo, '/api/author/get')) {
                    // yasoon_site_author_getshortinfo
                    if (0 === strpos($pathinfo, '/api/author/get_short_info') && preg_match('#^/api/author/get_short_info/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_author_getshortinfo;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_getshortinfo')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getShortInfoAction',));
                    }
                    not_yasoon_site_author_getshortinfo:

                    // yasoon_site_author_getshortuserdata
                    if ($pathinfo === '/api/author/getShortuserData') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_author_getshortuserdata;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getShortuserDataAction',  '_route' => 'yasoon_site_author_getshortuserdata',);
                    }
                    not_yasoon_site_author_getshortuserdata:

                }

                // yasoon_site_author_cleartimeline
                if ($pathinfo === '/api/author/clearTimeline') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_author_cleartimeline;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::clearTimeline',  '_route' => 'yasoon_site_author_cleartimeline',);
                }
                not_yasoon_site_author_cleartimeline:

                if (0 === strpos($pathinfo, '/api/author/get')) {
                    if (0 === strpos($pathinfo, '/api/author/get_')) {
                        // yasoon_site_author_getstatusinfo
                        if ($pathinfo === '/api/author/get_status_info') {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_author_getstatusinfo;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getStatusInfoAction',  '_route' => 'yasoon_site_author_getstatusinfo',);
                        }
                        not_yasoon_site_author_getstatusinfo:

                        // yasoon_site_author_getposts
                        if (0 === strpos($pathinfo, '/api/author/get_posts') && preg_match('#^/api/author/get_posts/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_author_getposts;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_getposts')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getPostsAction',));
                        }
                        not_yasoon_site_author_getposts:

                    }

                    // yasoon_site_author_getauthorinfo
                    if ($pathinfo === '/api/author/getAuthorInfo') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_author_getauthorinfo;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getAuthorInfo',  '_route' => 'yasoon_site_author_getauthorinfo',);
                    }
                    not_yasoon_site_author_getauthorinfo:

                    if (0 === strpos($pathinfo, '/api/author/get_questions')) {
                        // yasoon_site_author_getquestions
                        if ($pathinfo === '/api/author/get_questions') {
                            if ($this->context->getMethod() != 'POST') {
                                $allow[] = 'POST';
                                goto not_yasoon_site_author_getquestions;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getQuestionsAction',  '_route' => 'yasoon_site_author_getquestions',);
                        }
                        not_yasoon_site_author_getquestions:

                        // yasoon_site_author_getquestionsstack
                        if (0 === strpos($pathinfo, '/api/author/get_questions_stack') && preg_match('#^/api/author/get_questions_stack/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                            if ($this->context->getMethod() != 'POST') {
                                $allow[] = 'POST';
                                goto not_yasoon_site_author_getquestionsstack;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_getquestionsstack')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getQuestionsStackAction',));
                        }
                        not_yasoon_site_author_getquestionsstack:

                    }

                }

                if (0 === strpos($pathinfo, '/api/author/update_')) {
                    // yasoon_site_author_updatequestionsplaces
                    if (0 === strpos($pathinfo, '/api/author/update_questions_places') && preg_match('#^/api/author/update_questions_places/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_author_updatequestionsplaces;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_updatequestionsplaces')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::updateQuestionsPlaces',));
                    }
                    not_yasoon_site_author_updatequestionsplaces:

                    // yasoon_site_author_updatepostsplaces
                    if (0 === strpos($pathinfo, '/api/author/update_posts_places') && preg_match('#^/api/author/update_posts_places/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_author_updatepostsplaces;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_updatepostsplaces')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::updatePostsPlaces',));
                    }
                    not_yasoon_site_author_updatepostsplaces:

                }

                // yasoon_site_author_getblank
                if (0 === strpos($pathinfo, '/api/author/get_blank') && preg_match('#^/api/author/get_blank/(?P<authorId>\\d+)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_author_getblank;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_getblank')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::getBlankAction',));
                }
                not_yasoon_site_author_getblank:

                // yasoon_site_author_register
                if ($pathinfo === '/api/author/register') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_author_register;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::register',  '_route' => 'yasoon_site_author_register',);
                }
                not_yasoon_site_author_register:

                // yasoon_site_author_send_mail
                if ($pathinfo === '/api/author/send_mail') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_author_send_mail;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::send_mail',  '_route' => 'yasoon_site_author_send_mail',);
                }
                not_yasoon_site_author_send_mail:

                // yasoon_site_author_editinfo
                if ($pathinfo === '/api/author/editinfo') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_author_editinfo;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::editInfo',  '_route' => 'yasoon_site_author_editinfo',);
                }
                not_yasoon_site_author_editinfo:

                // yasoon_site_author_notify
                if ($pathinfo === '/api/author/notify') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_author_notify;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::notify',  '_route' => 'yasoon_site_author_notify',);
                }
                not_yasoon_site_author_notify:

                // yasoon_site_author_change_pass
                if (0 === strpos($pathinfo, '/api/author/change_pass') && preg_match('#^/api/author/change_pass/(?P<email>[^/]++)/(?P<hash>[^/]++)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_author_change_pass;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_author_change_pass')), array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::change_pass',));
                }
                not_yasoon_site_author_change_pass:

                // yasoon_site_author_uploaduserimage
                if ($pathinfo === '/api/author/upload_user_image') {
                    if (!in_array($this->context->getMethod(), array('FILES', 'POST'))) {
                        $allow = array_merge($allow, array('FILES', 'POST'));
                        goto not_yasoon_site_author_uploaduserimage;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\AuthorController::uploadUserImage',  '_route' => 'yasoon_site_author_uploaduserimage',);
                }
                not_yasoon_site_author_uploaduserimage:

            }

            if (0 === strpos($pathinfo, '/api/blank_question')) {
                // yasoon_site_blankquestion_getblank
                if ($pathinfo === '/api/blank_question/get_blank') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_blankquestion_getblank;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\BlankQuestionController::getBlankAction',  '_route' => 'yasoon_site_blankquestion_getblank',);
                }
                not_yasoon_site_blankquestion_getblank:

                // yasoon_site_blankquestion_add
                if ($pathinfo === '/api/blank_question/add') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_blankquestion_add;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\BlankQuestionController::addAction',  '_route' => 'yasoon_site_blankquestion_add',);
                }
                not_yasoon_site_blankquestion_add:

                // yasoon_site_blankquestion_update
                if ($pathinfo === '/api/blank_question/update') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_blankquestion_update;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\BlankQuestionController::updateAction',  '_route' => 'yasoon_site_blankquestion_update',);
                }
                not_yasoon_site_blankquestion_update:

                // yasoon_site_blankquestion_remove
                if ($pathinfo === '/api/blank_question/delete') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_blankquestion_remove;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\BlankQuestionController::removeAction',  '_route' => 'yasoon_site_blankquestion_remove',);
                }
                not_yasoon_site_blankquestion_remove:

                // yasoon_site_blankquestion_updateplaces
                if ($pathinfo === '/api/blank_question/update_places') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_blankquestion_updateplaces;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\BlankQuestionController::updatePlaces',  '_route' => 'yasoon_site_blankquestion_updateplaces',);
                }
                not_yasoon_site_blankquestion_updateplaces:

            }

            if (0 === strpos($pathinfo, '/api/c')) {
                // yasoon_site_categories_categorylist
                if ($pathinfo === '/api/category/get_CategoryList') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_categories_categorylist;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\CategoriesController::categoryListAction',  '_route' => 'yasoon_site_categories_categorylist',);
                }
                not_yasoon_site_categories_categorylist:

                if (0 === strpos($pathinfo, '/api/content')) {
                    // yasoon_site_content_getallcontent
                    if ($pathinfo === '/api/content/get_all') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_content_getallcontent;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ContentController::getAllContent',  '_route' => 'yasoon_site_content_getallcontent',);
                    }
                    not_yasoon_site_content_getallcontent:

                    // yasoon_site_content_editrow
                    if ($pathinfo === '/api/content/edit') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_content_editrow;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ContentController::editRow',  '_route' => 'yasoon_site_content_editrow',);
                    }
                    not_yasoon_site_content_editrow:

                    // yasoon_site_content_addrow
                    if ($pathinfo === '/api/content/add') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_content_addrow;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ContentController::addRow',  '_route' => 'yasoon_site_content_addrow',);
                    }
                    not_yasoon_site_content_addrow:

                    // yasoon_site_content_deleterow
                    if ($pathinfo === '/api/content/delete') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_content_deleterow;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\ContentController::deleteRow',  '_route' => 'yasoon_site_content_deleterow',);
                    }
                    not_yasoon_site_content_deleterow:

                }

            }

            if (0 === strpos($pathinfo, '/api/friends')) {
                // yasoon_site_friends_add
                if (0 === strpos($pathinfo, '/api/friends/add') && preg_match('#^/api/friends/add/(?P<writerId>\\d+)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_friends_add;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_friends_add')), array (  '_controller' => 'Yasoon\\Site\\Controller\\FriendsController::addAction',));
                }
                not_yasoon_site_friends_add:

                // yasoon_site_friends_delete
                if (0 === strpos($pathinfo, '/api/friends/delete') && preg_match('#^/api/friends/delete/(?P<writerId>\\d+)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_friends_delete;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_friends_delete')), array (  '_controller' => 'Yasoon\\Site\\Controller\\FriendsController::deleteAction',));
                }
                not_yasoon_site_friends_delete:

                // yasoon_site_friends_gettimelinestack
                if ($pathinfo === '/api/friends/timeline_stack') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_friends_gettimelinestack;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\FriendsController::getTimelineStackAction',  '_route' => 'yasoon_site_friends_gettimelinestack',);
                }
                not_yasoon_site_friends_gettimelinestack:

                // yasoon_site_friends_getadmintimelinestack
                if ($pathinfo === '/api/friends/admin_timeline_stack') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_friends_getadmintimelinestack;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\FriendsController::getAdminTimelineStackAction',  '_route' => 'yasoon_site_friends_getadmintimelinestack',);
                }
                not_yasoon_site_friends_getadmintimelinestack:

                // yasoon_site_friends_gettimeline
                if ($pathinfo === '/api/friends/timeline') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_friends_gettimeline;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\FriendsController::getTimelineAction',  '_route' => 'yasoon_site_friends_gettimeline',);
                }
                not_yasoon_site_friends_gettimeline:

            }

        }

        // yasoon_site_index_index
        if (rtrim($pathinfo, '/') === '') {
            if (substr($pathinfo, -1) !== '/') {
                return $this->redirect($pathinfo.'/', 'yasoon_site_index_index');
            }

            return array (  '_controller' => 'Yasoon\\Site\\Controller\\IndexController::indexAction',  '_route' => 'yasoon_site_index_index',);
        }

        // yasoon_site_index_admin
        if ($pathinfo === '/admin') {
            return array (  '_controller' => 'Yasoon\\Site\\Controller\\IndexController::adminAction',  '_route' => 'yasoon_site_index_admin',);
        }

        // yasoon_site_index_test
        if ($pathinfo === '/test_user') {
            return array (  '_controller' => 'Yasoon\\Site\\Controller\\IndexController::testAction',  '_route' => 'yasoon_site_index_test',);
        }

        if (0 === strpos($pathinfo, '/api')) {
            if (0 === strpos($pathinfo, '/api/interview')) {
                // yasoon_site_interview_questions
                if (0 === strpos($pathinfo, '/api/interview/questions') && preg_match('#^/api/interview/questions/(?P<interviewId>\\d+)$#s', $pathinfo, $matches)) {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_interview_questions;
                    }

                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_interview_questions')), array (  '_controller' => 'Yasoon\\Site\\Controller\\InterviewController::questions',));
                }
                not_yasoon_site_interview_questions:

                if (0 === strpos($pathinfo, '/api/interview/get_')) {
                    // yasoon_site_interview_get_answers
                    if (0 === strpos($pathinfo, '/api/interview/get_answers') && preg_match('#^/api/interview/get_answers/(?P<questionId>[^/]++)$#s', $pathinfo, $matches)) {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_interview_get_answers;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_interview_get_answers')), array (  '_controller' => 'Yasoon\\Site\\Controller\\InterviewController::get_answers',));
                    }
                    not_yasoon_site_interview_get_answers:

                    // yasoon_site_interview_get_interview
                    if ($pathinfo === '/api/interview/get_interviews') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_interview_get_interview;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\InterviewController::get_interview',  '_route' => 'yasoon_site_interview_get_interview',);
                    }
                    not_yasoon_site_interview_get_interview:

                }

                // yasoon_site_interview_save_interview
                if ($pathinfo === '/api/interview/save_interview') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_interview_save_interview;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\InterviewController::save_interview',  '_route' => 'yasoon_site_interview_save_interview',);
                }
                not_yasoon_site_interview_save_interview:

            }

            if (0 === strpos($pathinfo, '/api/p')) {
                if (0 === strpos($pathinfo, '/api/people')) {
                    if (0 === strpos($pathinfo, '/api/people/get_')) {
                        // yasoon_site_people_getauthors
                        if (0 === strpos($pathinfo, '/api/people/get_authors') && preg_match('#^/api/people/get_authors/(?P<categoryId>\\d+)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_people_getauthors;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_getauthors')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::getAuthorsAction',));
                        }
                        not_yasoon_site_people_getauthors:

                        if (0 === strpos($pathinfo, '/api/people/get_posts_')) {
                            // yasoon_site_people_getpostsbydate
                            if (0 === strpos($pathinfo, '/api/people/get_posts_date') && preg_match('#^/api/people/get_posts_date/(?P<categoryId>\\d+)$#s', $pathinfo, $matches)) {
                                if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                    $allow = array_merge($allow, array('GET', 'HEAD'));
                                    goto not_yasoon_site_people_getpostsbydate;
                                }

                                return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_getpostsbydate')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::getPostsByDateAction',));
                            }
                            not_yasoon_site_people_getpostsbydate:

                            // yasoon_site_people_getpostsbyrating
                            if (0 === strpos($pathinfo, '/api/people/get_posts_rating') && preg_match('#^/api/people/get_posts_rating/(?P<categoryId>\\d+)$#s', $pathinfo, $matches)) {
                                if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                    $allow = array_merge($allow, array('GET', 'HEAD'));
                                    goto not_yasoon_site_people_getpostsbyrating;
                                }

                                return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_getpostsbyrating')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::getPostsByRatingAction',));
                            }
                            not_yasoon_site_people_getpostsbyrating:

                        }

                        // yasoon_site_people_getaboutinfo
                        if ($pathinfo === '/api/people/get_about_info') {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_people_getaboutinfo;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::getAboutInfoAction',  '_route' => 'yasoon_site_people_getaboutinfo',);
                        }
                        not_yasoon_site_people_getaboutinfo:

                    }

                    if (0 === strpos($pathinfo, '/api/people/search_')) {
                        if (0 === strpos($pathinfo, '/api/people/search_post_by_')) {
                            // yasoon_site_people_searchpostbydate
                            if (0 === strpos($pathinfo, '/api/people/search_post_by_date') && preg_match('#^/api/people/search_post_by_date/(?P<text>[^/]++)$#s', $pathinfo, $matches)) {
                                if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                    $allow = array_merge($allow, array('GET', 'HEAD'));
                                    goto not_yasoon_site_people_searchpostbydate;
                                }

                                return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_searchpostbydate')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::searchPostByDateAction',));
                            }
                            not_yasoon_site_people_searchpostbydate:

                            // yasoon_site_people_searchpostbyrating
                            if (0 === strpos($pathinfo, '/api/people/search_post_by_rating') && preg_match('#^/api/people/search_post_by_rating/(?P<text>[^/]++)$#s', $pathinfo, $matches)) {
                                if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                    $allow = array_merge($allow, array('GET', 'HEAD'));
                                    goto not_yasoon_site_people_searchpostbyrating;
                                }

                                return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_searchpostbyrating')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::searchPostByRatingAction',));
                            }
                            not_yasoon_site_people_searchpostbyrating:

                        }

                        // yasoon_site_people_searchauthor
                        if (0 === strpos($pathinfo, '/api/people/search_author') && preg_match('#^/api/people/search_author/(?P<text>[^/]++)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_people_searchauthor;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_people_searchauthor')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PeopleController::searchAuthorAction',));
                        }
                        not_yasoon_site_people_searchauthor:

                    }

                }

                if (0 === strpos($pathinfo, '/api/post')) {
                    // yasoon_site_post_savepost
                    if ($pathinfo === '/api/post/savePost') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_post_savepost;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::savePost',  '_route' => 'yasoon_site_post_savepost',);
                    }
                    not_yasoon_site_post_savepost:

                    // yasoon_site_post_add
                    if ($pathinfo === '/api/post/add') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_post_add;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::addAction',  '_route' => 'yasoon_site_post_add',);
                    }
                    not_yasoon_site_post_add:

                    // yasoon_site_post_update
                    if ($pathinfo === '/api/post/update') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_post_update;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::updateAction',  '_route' => 'yasoon_site_post_update',);
                    }
                    not_yasoon_site_post_update:

                    // yasoon_site_post_deletepost
                    if ($pathinfo === '/api/post/deletePost') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_post_deletepost;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::deletePost',  '_route' => 'yasoon_site_post_deletepost',);
                    }
                    not_yasoon_site_post_deletepost:

                    if (0 === strpos($pathinfo, '/api/post/get')) {
                        if (0 === strpos($pathinfo, '/api/post/getPost')) {
                            // yasoon_site_post_getpost
                            if ($pathinfo === '/api/post/getPost') {
                                if ($this->context->getMethod() != 'POST') {
                                    $allow[] = 'POST';
                                    goto not_yasoon_site_post_getpost;
                                }

                                return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getPostAction',  '_route' => 'yasoon_site_post_getpost',);
                            }
                            not_yasoon_site_post_getpost:

                            // yasoon_site_post_getpostsbydate
                            if ($pathinfo === '/api/post/getPostsByDate') {
                                if ($this->context->getMethod() != 'POST') {
                                    $allow[] = 'POST';
                                    goto not_yasoon_site_post_getpostsbydate;
                                }

                                return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getPostsByDate',  '_route' => 'yasoon_site_post_getpostsbydate',);
                            }
                            not_yasoon_site_post_getpostsbydate:

                        }

                        // yasoon_site_post_geteditpost
                        if (0 === strpos($pathinfo, '/api/post/getEditPost') && preg_match('#^/api/post/getEditPost/(?P<postId>\\d+)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_geteditpost;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_post_geteditpost')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getEditPost',));
                        }
                        not_yasoon_site_post_geteditpost:

                        // yasoon_site_post_getquestions
                        if ($pathinfo === '/api/post/getQuestions') {
                            if ($this->context->getMethod() != 'POST') {
                                $allow[] = 'POST';
                                goto not_yasoon_site_post_getquestions;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getQuestions',  '_route' => 'yasoon_site_post_getquestions',);
                        }
                        not_yasoon_site_post_getquestions:

                        // yasoon_site_post_getstoryoftheday
                        if ($pathinfo === '/api/post/get_daystory') {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_getstoryoftheday;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getStoryOfTheDayAction',  '_route' => 'yasoon_site_post_getstoryoftheday',);
                        }
                        not_yasoon_site_post_getstoryoftheday:

                    }

                    // yasoon_site_post_setstoryoftheday
                    if (0 === strpos($pathinfo, '/api/post/set_daystory') && preg_match('#^/api/post/set_daystory/(?P<postId>\\d+)$#s', $pathinfo, $matches)) {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_post_setstoryoftheday;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_post_setstoryoftheday')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::setStoryOfTheDayAction',));
                    }
                    not_yasoon_site_post_setstoryoftheday:

                    // yasoon_site_post_like
                    if (0 === strpos($pathinfo, '/api/post/like') && preg_match('#^/api/post/like/(?P<postId>\\d+)$#s', $pathinfo, $matches)) {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_post_like;
                        }

                        return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_post_like')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::like',));
                    }
                    not_yasoon_site_post_like:

                    // yasoon_site_post_addlikes
                    if ($pathinfo === '/api/post/add_likes') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_post_addlikes;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::addLikes',  '_route' => 'yasoon_site_post_addlikes',);
                    }
                    not_yasoon_site_post_addlikes:

                    if (0 === strpos($pathinfo, '/api/post/get_')) {
                        // yasoon_site_post_getlastweekposts
                        if ($pathinfo === '/api/post/get_all_last_week') {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_getlastweekposts;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getLastWeekPosts',  '_route' => 'yasoon_site_post_getlastweekposts',);
                        }
                        not_yasoon_site_post_getlastweekposts:

                        // yasoon_site_post_getbestposts
                        if ($pathinfo === '/api/post/get_best_posts') {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_getbestposts;
                            }

                            return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::getBestPosts',  '_route' => 'yasoon_site_post_getbestposts',);
                        }
                        not_yasoon_site_post_getbestposts:

                    }

                    // yasoon_site_post_partnerinfo
                    if ($pathinfo === '/api/post/partnerInfo') {
                        if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                            $allow = array_merge($allow, array('GET', 'HEAD'));
                            goto not_yasoon_site_post_partnerinfo;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::partnerInfo',  '_route' => 'yasoon_site_post_partnerinfo',);
                    }
                    not_yasoon_site_post_partnerinfo:

                    if (0 === strpos($pathinfo, '/api/post/get_categoryP')) {
                        // yasoon_site_post_get_categoryposts
                        if (0 === strpos($pathinfo, '/api/post/get_categoryPosts') && preg_match('#^/api/post/get_categoryPosts/(?P<catId>\\d+)/(?P<catPage>\\d+)/(?P<maxPagePosts>\\d+)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_get_categoryposts;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_post_get_categoryposts')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::get_categoryPosts',));
                        }
                        not_yasoon_site_post_get_categoryposts:

                        // yasoon_site_post_get_categorypeople
                        if (0 === strpos($pathinfo, '/api/post/get_categoryPeople') && preg_match('#^/api/post/get_categoryPeople/(?P<catId>\\d+)/(?P<catPage>[^/]++)/(?P<maxPagePeople>[^/]++)$#s', $pathinfo, $matches)) {
                            if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                                $allow = array_merge($allow, array('GET', 'HEAD'));
                                goto not_yasoon_site_post_get_categorypeople;
                            }

                            return $this->mergeDefaults(array_replace($matches, array('_route' => 'yasoon_site_post_get_categorypeople')), array (  '_controller' => 'Yasoon\\Site\\Controller\\PostController::get_categoryPeople',));
                        }
                        not_yasoon_site_post_get_categorypeople:

                    }

                }

            }

            if (0 === strpos($pathinfo, '/api/question')) {
                if (0 === strpos($pathinfo, '/api/question/add')) {
                    // yasoon_site_question_add
                    if ($pathinfo === '/api/question/add') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_question_add;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\QuestionController::addAction',  '_route' => 'yasoon_site_question_add',);
                    }
                    not_yasoon_site_question_add:

                    // yasoon_site_question_addinterview
                    if ($pathinfo === '/api/question/add_interview') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_yasoon_site_question_addinterview;
                        }

                        return array (  '_controller' => 'Yasoon\\Site\\Controller\\QuestionController::addInterviewAction',  '_route' => 'yasoon_site_question_addinterview',);
                    }
                    not_yasoon_site_question_addinterview:

                }

                // yasoon_site_question_setinterviewcaption
                if ($pathinfo === '/api/question/set_interview_caption') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_question_setinterviewcaption;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\QuestionController::setInterviewCaption',  '_route' => 'yasoon_site_question_setinterviewcaption',);
                }
                not_yasoon_site_question_setinterviewcaption:

                // yasoon_site_question_update
                if ($pathinfo === '/api/question/update') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_question_update;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\QuestionController::updateAction',  '_route' => 'yasoon_site_question_update',);
                }
                not_yasoon_site_question_update:

                // yasoon_site_question_remove
                if ($pathinfo === '/api/question/delete') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_yasoon_site_question_remove;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\QuestionController::removeAction',  '_route' => 'yasoon_site_question_remove',);
                }
                not_yasoon_site_question_remove:

            }

        }

        if (0 === strpos($pathinfo, '/s')) {
            if (0 === strpos($pathinfo, '/socauth')) {
                // yasoon_site_socialauth_test
                if ($pathinfo === '/socauth/test') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_socialauth_test;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\SocialAuthController::test',  '_route' => 'yasoon_site_socialauth_test',);
                }
                not_yasoon_site_socialauth_test:

                // yasoon_site_socialauth_testvk
                if ($pathinfo === '/socauth/vkontakte') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_socialauth_testvk;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\SocialAuthController::testvk',  '_route' => 'yasoon_site_socialauth_testvk',);
                }
                not_yasoon_site_socialauth_testvk:

                // yasoon_site_socialauth_testfb
                if ($pathinfo === '/socauth/facebook') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_socialauth_testfb;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\SocialAuthController::testfb',  '_route' => 'yasoon_site_socialauth_testfb',);
                }
                not_yasoon_site_socialauth_testfb:

                // yasoon_site_socialauth_my_tests
                if ($pathinfo === '/socauth/my_test') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_socialauth_my_tests;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\SocialAuthController::my_tests',  '_route' => 'yasoon_site_socialauth_my_tests',);
                }
                not_yasoon_site_socialauth_my_tests:

            }

            if (0 === strpos($pathinfo, '/statistic/get')) {
                // yasoon_site_statistic_getnewusers
                if ($pathinfo === '/statistic/getNewUsers') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_statistic_getnewusers;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\StatisticController::getNewUsers',  '_route' => 'yasoon_site_statistic_getnewusers',);
                }
                not_yasoon_site_statistic_getnewusers:

                // yasoon_site_statistic_getpassusers
                if ($pathinfo === '/statistic/getPassUsers') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_statistic_getpassusers;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\StatisticController::getPassUsers',  '_route' => 'yasoon_site_statistic_getpassusers',);
                }
                not_yasoon_site_statistic_getpassusers:

                // yasoon_site_statistic_getcountstatistic
                if ($pathinfo === '/statistic/getCountStatistic') {
                    if (!in_array($this->context->getMethod(), array('GET', 'HEAD'))) {
                        $allow = array_merge($allow, array('GET', 'HEAD'));
                        goto not_yasoon_site_statistic_getcountstatistic;
                    }

                    return array (  '_controller' => 'Yasoon\\Site\\Controller\\StatisticController::getCountStatistic',  '_route' => 'yasoon_site_statistic_getcountstatistic',);
                }
                not_yasoon_site_statistic_getcountstatistic:

            }

        }

        throw 0 < count($allow) ? new MethodNotAllowedException(array_unique($allow)) : new ResourceNotFoundException();
    }
}
