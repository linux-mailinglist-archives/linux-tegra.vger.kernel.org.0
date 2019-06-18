Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D29834A543
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 17:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbfFRPZe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 11:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbfFRPZd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 11:25:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A4172085A;
        Tue, 18 Jun 2019 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560871532;
        bh=umwZ2fSThqgxmTpanW108b4UmSd8DfrTMOsyqk7eOfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cfGmNlSQZFhPpQnGu7rDNvAqd/OQS9fMf6fzNB6cE5l59zhny3qrIo6AAOfQY89wm
         EdURUTV90LU+kcxDqek37EUFwx4iN0vyD18gAViohWDtYRePiHm7W0fNIZxeS+c0uB
         fP6C5sDcDOyJXBMQKPqz9sE+v8od3FFvATsvEMP4=
Date:   Tue, 18 Jun 2019 17:25:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: drm connectors, tegra,  and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618152530.GA4576@kroah.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618151938.GA2567@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > Greg is busy already, but maybe he won't do everything ...
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 9717540ee28f..026e55c517e1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> >    this (together with the drm_minor->drm_device move) would allow us to remove
> >    debugfs_init.
> >  
> > +- Drop the return code and error checking from all debugfs functions. Greg KH is
> > +  working on this already.
> 
> 
> Part of this work was to try to delete drm_debugfs_remove_files().
> 
> There are only 4 files that currently still call this function:
> 	drivers/gpu/drm/tegra/dc.c
> 	drivers/gpu/drm/tegra/dsi.c
> 	drivers/gpu/drm/tegra/hdmi.c
> 	drivers/gpu/drm/tegra/sor.c
> 
> For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> debugfs directory.  Which is fine, but it has to do some special memory
> allocation to get the debugfs callback to point not to the struct
> drm_minor pointer, but rather the drm_crtc structure.
> 
> So, to remove this call, I need to remove this special memory allocation
> and to do that, I need to somehow be able to cast from drm_minor back to
> the drm_crtc structure being used in this driver.  And I can't figure
> how they are related at all.
> 
> Any pointers here (pun intended) would be appreciated.
> 
> For the other 3 files, the situation is much the same, but I need to get
> from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.
> 
> I could just "open code" a bunch of calls to debugfs_create_file() for
> these drivers, which would solve this issue, but in a more "non-drm"
> way.  Is it worth to just do that instead of overthinking the whole
> thing and trying to squish it into the drm "model" of drm debugfs calls?

An example of "open coding" this is the patch below for the sor.c
driver.

Totally untested, not even built, but you should get the idea here.

thanks,

greg k-h

---------------

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 5be5a0817dfe..3216221c77c4 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -414,7 +414,8 @@ struct tegra_sor {
 
 	struct drm_dp_aux *aux;
 
-	struct drm_info_list *debugfs_files;
+	struct dentry *debugfs_root;
+	struct drm_device *drm;
 
 	const struct tegra_sor_ops *ops;
 	enum tegra_io_pad pad;
@@ -1262,10 +1263,9 @@ static int tegra_sor_crc_wait(struct tegra_sor *sor, unsigned long timeout)
 
 static int tegra_sor_show_crc(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct tegra_sor *sor = node->info_ent->data;
+	struct tegra_sor *sor = s->private;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = sor->drm;
 	int err = 0;
 	u32 value;
 
@@ -1302,6 +1302,20 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	return err;
 }
 
+static int crc_open(struct inode *inode, struct file *file)
+{
+	struct tegra_sor *sor = inode->i_private;
+	return single_open(file, tegra_sor_show_crc, sor);
+}
+
+static const struct file_operations crc_fops = {
+	.owner = THIS_MODULE,
+	.open = crc_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 #define DEBUGFS_REG32(_name) { .name = #_name, .offset = _name }
 
 static const struct debugfs_reg32 tegra_sor_regs[] = {
@@ -1424,10 +1438,9 @@ static const struct debugfs_reg32 tegra_sor_regs[] = {
 
 static int tegra_sor_show_regs(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct tegra_sor *sor = node->info_ent->data;
+	struct tegra_sor *sor = s->private;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
-	struct drm_device *drm = node->minor->dev;
+	struct drm_device *drm = sor->drm;
 	unsigned int i;
 	int err = 0;
 
@@ -1450,51 +1463,44 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	return err;
 }
 
-static const struct drm_info_list debugfs_files[] = {
-	{ "crc", tegra_sor_show_crc, 0, NULL },
-	{ "regs", tegra_sor_show_regs, 0, NULL },
+static int regs_open(struct inode *inode, struct file *file)
+{
+	struct tegra_sor *sor = inode->i_private;
+	return single_open(file, tegra_sor_show_regs, sor);
+}
+
+static const struct file_operations crc_fops = {
+	.owner = THIS_MODULE,
+	.open = crc_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
 };
 
 static int tegra_sor_late_register(struct drm_connector *connector)
 {
-	struct tegra_output *output = connector_to_output(connector);
-	unsigned int i, count = ARRAY_SIZE(debugfs_files);
 	struct drm_minor *minor = connector->dev->primary;
-	struct dentry *root = connector->debugfs_entry;
+	struct tegra_output *output = connector_to_output(connector);
 	struct tegra_sor *sor = to_sor(output);
-	int err;
+	struct dentry *root;
 
-	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
-				     GFP_KERNEL);
-	if (!sor->debugfs_files)
-		return -ENOMEM;
+	sor->drm = minor->dev;
 
-	for (i = 0; i < count; i++)
-		sor->debugfs_files[i].data = sor;
+	root = debugfs_create_dir("sor", connector->debugfs_entry);
+	sor->debugfs_root = root;
 
-	err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	debugfs_create_file("crc", S_IFREG | S_IRUGO, root, sor, &crc_fops);
+	debugfs_create_file("regs", S_IFREG | S_IRUGO, root, sor, &regs_fops);
 
 	return 0;
-
-free:
-	kfree(sor->debugfs_files);
-	sor->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_sor_early_unregister(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct tegra_sor *sor = to_sor(output);
 
-	drm_debugfs_remove_files(sor->debugfs_files, count,
-				 connector->dev->primary);
-	kfree(sor->debugfs_files);
-	sor->debugfs_files = NULL;
+	debugfs_remove_recursive(sor->debugfs_root);
 }
 
 static void tegra_sor_connector_reset(struct drm_connector *connector)
