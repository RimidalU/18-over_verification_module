{$age_verified = $auth.check_age}

{capture name="age_check_form"}
        <form name="18_verification" action="{""|fn_url}" method="post" enctype="multipart/form-data" class="cm-ajax-full-render">
            <div class="ty-control-group ty-product-notification__body">
                <label class="ty-control-group__title cm-required" for="birthday">
                    {__("enter_your_date_of_birth")}
                </label>
                    {include 
                        file="common/calendar.tpl"
                        date_id="birthday"
                        date_name="18_verification[birthday]"
                        date_val=$auth.birthday
                        is_changeable_range=false
                    }
            </div>
            <div class="buttons-container">
                {include
                    file="buttons/button.tpl"
                    but_text=__("submit")
                    but_meta="ty-btn ty-btn__primary cm-post cm-form-dialog-closer"
                    but_role="submit" 
                    but_name="dispatch[18_verification.check_age]"
                }
            </div>
        </form>
{/capture}

{capture name="content_unavailable"}
    <div class="ty-control-group ty-product-notification__body">
        <span>
            {__("allowed_age_not_confirmed")}
        </span>
    </div>
{/capture}

{if $auth.check_age !== "YesNo::YES"|enum}
    <div class="ty-popup-age-check" id="18_verification_content">
        
        {include "addons/18_verification/views/components/pop-up.tpl"
            title=($age_verified === "YesNo::NO"|enum) ?
                {__("access_to_the_site_is_closed")} :
                {__("age_verification")}
            content=($age_verified === "YesNo::NO"|enum) ?
                $smarty.capture.content_unavailable :
                $smarty.capture.age_check_form}
    </div>
{/if}
