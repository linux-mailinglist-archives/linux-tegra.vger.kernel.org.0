Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF6E21E084
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jul 2020 21:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGMTLU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jul 2020 15:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGMTLU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jul 2020 15:11:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDFDC061755
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2020 12:11:20 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so5920742plx.6
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2020 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K9bKl04TiecTHi6yQKqCyqcVhVmkhlQgjawYP95KECc=;
        b=azmxqowhmZE5KngzFQMGOBQ+Tzr0C4orCvrkc8i+1TNQhK4UD5u6WbIXsiaZrinfho
         YqV3lwuEyPXSAQewrmFlPQgUWmtrHpAPGQS+Ma5LOVe53dlRPc2ez0sRCVCRwdi4UB8g
         EaMlJ9/1ocA7q3nuR8ZiwzkeMLdEnErKm1N7VQdUOn8z7aDPPilrdUdByHzXkWAK7CKD
         jo6KVLNXhzRMEInsC6VvUki7cD9sgl43mnJhNXDsKp10UdkqkbAu1vRHi/B4HbOWXKwj
         YHKVZukc+esKATGUTvUEm2tHVS3v0hE5rJJhW3QYD6tiPRUlNj4hxa3ZCIrAtBJX1HA0
         vBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K9bKl04TiecTHi6yQKqCyqcVhVmkhlQgjawYP95KECc=;
        b=X/OfBVOB2uz6uFrP/za5ry3Z3X77+xlfqazuAw16Tcucti95a+7ww/IB7iDfPweWNF
         eL5ztq7hjs1eLezExrMRqvJyMjfpD3yPXXsIbUZW2BUyvhaoZFFQdrfDEEKbQi7aCw7u
         cPgqm9J8gvju7S7oUd6WbLqQTuB27mqkXcZ06iXPzi8GoosMVCWRgl+xYKjmd+z5Zt28
         DABbKcdrDPrrCc3NDfOBRvQeqhJsjHXcJE2jRcMxiLp/dHRQTwJv9OUibBRnfa0Ln1Zg
         2UBetQHj0VCUcVXV7hvLyZ2FjzkUQ4Lw9oOUgd3W66QiEUyeBktXvEGZ4thKXHnK+tBd
         Jdbw==
X-Gm-Message-State: AOAM530YhKCMEZZqu+cYq0JteNhM2VDOPnxezvhVH0Airc7IbeFuam5J
        vl1FjOS2cMO+IypqfAvX5uFfpA==
X-Google-Smtp-Source: ABdhPJw0rLJdisr5uZlBE8ctgvrHmM+uwk53TpBTBJnI6WzxJkkgGNrd04RLKcWzKeNdyPokvfvd4g==
X-Received: by 2002:a17:90b:4ac7:: with SMTP id mh7mr914250pjb.158.1594667479834;
        Mon, 13 Jul 2020 12:11:19 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j17sm13472951pgn.87.2020.07.13.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:11:19 -0700 (PDT)
Date:   Mon, 13 Jul 2020 12:09:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, elder@ieee.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] remoteproc: qcom: Add per subsystem SSR
 notification
Message-ID: <20200713190911.GC388985@builder.lan>
References: <1592965408-16908-1-git-send-email-rishabhb@codeaurora.org>
 <1592965408-16908-2-git-send-email-rishabhb@codeaurora.org>
 <98e3a18e-1491-6f20-6507-d6e6817b76fe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98e3a18e-1491-6f20-6507-d6e6817b76fe@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon 13 Jul 09:26 PDT 2020, Jon Hunter wrote:

> 
> On 24/06/2020 03:23, Rishabh Bhatnagar wrote:
> > Currently there is a single notification chain which is called whenever any
> > remoteproc shuts down. This leads to all the listeners being notified, and
> > is not an optimal design as kernel drivers might only be interested in
> > listening to notifications from a particular remoteproc. Create a global
> > list of remoteproc notification info data structures. This will hold the
> > name and notifier_list information for a particular remoteproc. The API
> > to register for notifications will use name argument to retrieve the
> > notification info data structure and the notifier block will be added to
> > that data structure's notification chain. Also move from blocking notifier
> > to srcu notifer based implementation to support dynamic notifier head
> > creation.
> > 
> > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > ---
> >  drivers/remoteproc/qcom_common.c      | 90 ++++++++++++++++++++++++++++++-----
> >  drivers/remoteproc/qcom_common.h      |  5 +-
> >  include/linux/remoteproc/qcom_rproc.h | 20 ++++++--
> >  3 files changed, 95 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> > index 9028cea..7a7384c 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/module.h>
> >  #include <linux/notifier.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/remoteproc/qcom_rproc.h>
> >  #include <linux/rpmsg/qcom_glink.h>
> >  #include <linux/rpmsg/qcom_smd.h>
> >  #include <linux/soc/qcom/mdt_loader.h>
> > @@ -23,7 +24,14 @@
> >  #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
> >  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
> >  
> > -static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> > +struct qcom_ssr_subsystem {
> > +	const char *name;
> > +	struct srcu_notifier_head notifier_list;
> > +	struct list_head list;
> > +};
> > +
> > +static LIST_HEAD(qcom_ssr_subsystem_list);
> > +static DEFINE_MUTEX(qcom_ssr_subsys_lock);
> >  
> >  static int glink_subdev_start(struct rproc_subdev *subdev)
> >  {
> > @@ -189,37 +197,83 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
> >  
> > +static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
> > +{
> > +	struct qcom_ssr_subsystem *info;
> > +
> > +	mutex_lock(&qcom_ssr_subsys_lock);
> > +	/* Match in the global qcom_ssr_subsystem_list with name */
> > +	list_for_each_entry(info, &qcom_ssr_subsystem_list, list)
> > +		if (!strcmp(info->name, name))
> > +			goto out;
> > +
> > +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> > +	if (!info) {
> > +		info = ERR_PTR(-ENOMEM);
> > +		goto out;
> > +	}
> 
> 
> The above appears to be breaking the ARM64 build on the latest -next
> when building the modules  ...
>  
>   CC [M]  drivers/remoteproc/qcom_common.o
> drivers/remoteproc/qcom_common.c: In function 'qcom_ssr_get_subsys':
> remoteproc/qcom_common.c:210:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
>          ^~~~~~~
> drivers/remoteproc/qcom_common.c:210:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
> 

You're right, not sure why the test build completes successfully for
me...

I've applied a fix from Kefeng Wang for this, sorry for the disruption.

Regards,
Bjorn
