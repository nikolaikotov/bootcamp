class ExportMailer < ApplicationMailer
  default from: 'bootcamp_admin@coax.com'

  def send_department_data_as_pdf(email, department)
    pdf =  WickedPdf.new.pdf_from_string(
        ActionController::Base.new.render_to_string('pdf/show.html.erb', layout: 'pdf.html.erb', locals: { department: department })
    )
    attachments['department.pdf'] = { mime_type: 'application/pdf',
                                      content: pdf}
    mail(to: email, subject: 'pdf', template_name: 'send_department_data_as_pdf')
  end
end