
<div class="sucuriscan-panel">
    <h3 class="sucuriscan-title">Reset User Password</h3>

    <script type="text/javascript">
    /* global jQuery */
    /* jshint camelcase: false */
    jQuery(function ($) {
        $('#sucuriscan-reset-password-button').on('click', function (event) {
            event.preventDefault();
            $('.sucuriscan-reset-password-table :checkbox:checked').each(function (key, el) {
                var user_id = $(el).val();

                $('#sucuriscan-userid-' + user_id)
                .find('.sucuriscan-response')
                .html('(Loading...)');

                $.post('%%SUCURI.AjaxURL.Dashboard%%', {
                    action: 'sucuriscan_ajax',
                    sucuriscan_page_nonce: '%%SUCURI.PageNonce%%',
                    form_action: 'reset_user_password',
                    user_id: user_id,
                }, function (data) {
                    $('#sucuriscan-userid-' + user_id)
                    .find('.sucuriscan-response')
                    .html('(' + data + ')');
                });
            });
        });
    });
    </script>

    <div class="inside">
        <p>
            You can generate a new random password for the user accounts that
            you select from the list. An email with the new password will be
            sent to the email address of each chosen users.
        </p>

        <div class="sucuriscan-inline-alert-warning">
            <p>
                If you choose to change the password of your own user, then your
                current session will expire immediately. You will need to log
                into the admin panel with the new password that will be sent to
                your email. If you are unsure of this, do not select your
                account from the list.
            </p>
        </div>

        <table class="wp-list-table widefat sucuriscan-table sucuriscan-reset-password-table">
            <thead>
                <tr>
                    <td id="cb" class="manage-column column-cb check-column">
                        <label class="screen-reader-text" for="cb-select-all-1">Select All</label>
                        <input id="cb-select-all-1" type="checkbox">
                    </td>
                    <th class="manage-column">User</th>
                    <th class="manage-column">Email address</th>
                    <th class="manage-column">Registered</th>
                    <th class="manage-column">Roles</th>
                </tr>
            </thead>

            <tbody>
                %%%SUCURI.ResetPassword.UserList%%%

                <tr class="sucuriscan-%%SUCURI.ResetPassword.PaginationVisibility%%">
                    <td colspan="4">
                        <ul class="sucuriscan-pagination">
                            %%%SUCURI.ResetPassword.PaginationLinks%%%
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>

        <button type="button" id="sucuriscan-reset-password-button"
        class="button button-primary">Reset User Password</button>
    </div>
</div>