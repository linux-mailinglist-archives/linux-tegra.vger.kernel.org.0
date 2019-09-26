Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881F0BF757
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Sep 2019 19:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfIZRLE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 Sep 2019 13:11:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45323 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZRLE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Sep 2019 13:11:04 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so1302527pls.12
        for <linux-tegra@vger.kernel.org>; Thu, 26 Sep 2019 10:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y/PHP4OLdI45zIHPb8f9yOnc6gu1H47DcMn0ixy9Yf8=;
        b=PaBbwOTBVXkwCUFb6hkHfM2jTnsh6F2gQ4gVRZ1ldgfnElSkhjIiNiBhnAlH1Sutvn
         jbKLybsQEGovmfxORO/UbX39eiDaaSPWUsZx1flJ+8D5CwytzW4pxzC0TxjRv2rK6oga
         3ilJRbaq7RO5QVS8QglrlisubgfLi66p9HYLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y/PHP4OLdI45zIHPb8f9yOnc6gu1H47DcMn0ixy9Yf8=;
        b=E/xHXqyLQakzvk83UuI3JDgbdrGWHtY91mAB4Wfp0amjHaunp7KkdgxguYKPZDty9E
         XIEtlDu924+2X5odEHI4o4bG7wNUXZ1bffWLe0m8MOYPn/N3pfbvfO1JX+kktvt9G9vk
         B4d861yH46oU7/fqTaV/0MbmJshDfb6rz0Akib9FAkxC6jRemyZyShUNVW3zKOEAe8tt
         IafFCKT1gpaDVv+uH+LwbHWqMvpYgNvPPVf4drDxSVS5bdeVWspxMpPSQ1s+Qb06vnQe
         qqAZpFPilT3Wa89FqW4nFthAZzquCODIRXDfCcjh83d2YvpxbYlcO1jLBqNmcqSmK0gi
         ZuFA==
X-Gm-Message-State: APjAAAUhJd9Wq20tzbJ0UEvFk7UWL3IQwjjfi2RfDwKC5AXhsb9EB1j9
        tg8b4sqOVB2F6nKtLBnZ8CJRww==
X-Google-Smtp-Source: APXvYqxuSq/HWvt5bQoH3kWw9vWoOiWZGtdZkJlHWZR6QXtChqn2FUztl8LioG/WG6g+8FXOf4KYtw==
X-Received: by 2002:a17:902:aa4a:: with SMTP id c10mr4838234plr.340.1569517863376;
        Thu, 26 Sep 2019 10:11:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id z20sm2509355pjn.12.2019.09.26.10.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 10:11:02 -0700 (PDT)
Date:   Thu, 26 Sep 2019 10:11:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [PATCH 1/2] devfreq: Rename devfreq_update_status() to
 devfreq_update_stats() and viceversa
Message-ID: <20190926171100.GQ133864@google.com>
References: <20190925184314.30251-1-mka@chromium.org>
 <3015d1aec68ca2b35a263d61bf13077e@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3015d1aec68ca2b35a263d61bf13077e@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 26, 2019 at 08:21:51AM +0100, Ben Dooks wrote:
> /
> 
> On 2019-09-25 19:43, Matthias Kaehlcke wrote:
> > devfreq has two functions with very similar names,
> > devfreq_update_status()
> > and devfreq_update_stats(). _update_status() currently updates
> > frequency transitions statistics, while _update_stats() retrieves the
> > device 'status'. The function names are inversed with respect to what
> > the functions are actually doing, rename devfreq_update_status() to
> > devfreq_update_stats() and viceversa.
> 
> Wouldn't having devfreq_get_stats() be a better name for this if it
> is retrieving the stats?

struct devfreq_dev_status is a bit ambiguous. It contains 'stat' fields
like 'total_time' and 'busy_time', but also 'current_frequency' which is
more a 'status'. Given the name of the struct and the name of the hook
profile->get_dev_status I'm inclined to refer to it as 'status', also to
disambiguate it from the transition stats.

That said I'd welcome a name that's easier to differantiate from the other
devfreq_update_stat* function, like devfreq_update_status() or
devfreq_refresh_status().

> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > We could also rename the current devfreq_update_stats() to
> > devfreq_refresh_status() to make it easier to distinguish it from
> > devfreq_update_stats().
> > ---
> >  drivers/devfreq/devfreq.c                 | 12 ++++++------
> >  drivers/devfreq/governor.h                |  4 ++--
> >  drivers/devfreq/governor_passive.c        |  2 +-
> >  drivers/devfreq/governor_simpleondemand.c |  2 +-
> >  drivers/devfreq/tegra30-devfreq.c         |  2 +-
> >  5 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> > index 446490c9d635..fb4318d59aa9 100644
> > --- a/drivers/devfreq/devfreq.c
> > +++ b/drivers/devfreq/devfreq.c
> > @@ -151,11 +151,11 @@ static int set_freq_table(struct devfreq *devfreq)
> >  }
> > 
> >  /**
> > - * devfreq_update_status() - Update statistics of devfreq behavior
> > + * devfreq_update_stats() - Update statistics of devfreq behavior
> >   * @devfreq:	the devfreq instance
> >   * @freq:	the update target frequency
> >   */
> > -int devfreq_update_status(struct devfreq *devfreq, unsigned long freq)
> > +int devfreq_update_stats(struct devfreq *devfreq, unsigned long freq)
> >  {
> >  	int lev, prev_lev, ret = 0;
> >  	unsigned long cur_time;
> > @@ -191,7 +191,7 @@ int devfreq_update_status(struct devfreq *devfreq,
> > unsigned long freq)
> >  	devfreq->last_stat_updated = cur_time;
> >  	return ret;
> >  }
> > -EXPORT_SYMBOL(devfreq_update_status);
> > +EXPORT_SYMBOL(devfreq_update_stats);
> > 
> >  /**
> >   * find_devfreq_governor() - find devfreq governor from name
> > @@ -311,7 +311,7 @@ static int devfreq_set_target(struct devfreq
> > *devfreq, unsigned long new_freq,
> >  	freqs.new = new_freq;
> >  	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
> > 
> > -	if (devfreq_update_status(devfreq, new_freq))
> > +	if (devfreq_update_stats(devfreq, new_freq))
> >  		dev_err(&devfreq->dev,
> >  			"Couldn't update frequency transition information.\n");
> > 
> > @@ -450,7 +450,7 @@ void devfreq_monitor_suspend(struct devfreq
> > *devfreq)
> >  		return;
> >  	}
> > 
> > -	devfreq_update_status(devfreq, devfreq->previous_freq);
> > +	devfreq_update_stats(devfreq, devfreq->previous_freq);
> >  	devfreq->stop_polling = true;
> >  	mutex_unlock(&devfreq->lock);
> >  	cancel_delayed_work_sync(&devfreq->work);
> > @@ -1398,7 +1398,7 @@ static ssize_t trans_stat_show(struct device *dev,
> >  	unsigned int max_state = devfreq->profile->max_state;
> > 
> >  	if (!devfreq->stop_polling &&
> > -			devfreq_update_status(devfreq, devfreq->previous_freq))
> > +			devfreq_update_stats(devfreq, devfreq->previous_freq))
> >  		return 0;
> >  	if (max_state == 0)
> >  		return sprintf(buf, "Not Supported.\n");
> > diff --git a/drivers/devfreq/governor.h b/drivers/devfreq/governor.h
> > index bbe5ff9fcecf..e11f447be2b5 100644
> > --- a/drivers/devfreq/governor.h
> > +++ b/drivers/devfreq/governor.h
> > @@ -64,9 +64,9 @@ extern void devfreq_interval_update(struct devfreq
> > *devfreq,
> >  extern int devfreq_add_governor(struct devfreq_governor *governor);
> >  extern int devfreq_remove_governor(struct devfreq_governor *governor);
> > 
> > -extern int devfreq_update_status(struct devfreq *devfreq, unsigned long
> > freq);
> > +extern int devfreq_update_stats(struct devfreq *devfreq, unsigned long
> > freq);
> > 
> > -static inline int devfreq_update_stats(struct devfreq *df)
> > +static inline int devfreq_update_status(struct devfreq *df)
> >  {
> >  	return df->profile->get_dev_status(df->dev.parent, &df->last_status);
> >  }
> > diff --git a/drivers/devfreq/governor_passive.c
> > b/drivers/devfreq/governor_passive.c
> > index be6eeab9c814..1c746b96d3db 100644
> > --- a/drivers/devfreq/governor_passive.c
> > +++ b/drivers/devfreq/governor_passive.c
> > @@ -110,7 +110,7 @@ static int update_devfreq_passive(struct devfreq
> > *devfreq, unsigned long freq)
> >  		goto out;
> > 
> >  	if (devfreq->profile->freq_table
> > -		&& (devfreq_update_status(devfreq, freq)))
> > +		&& (devfreq_update_stats(devfreq, freq)))
> >  		dev_err(&devfreq->dev,
> >  			"Couldn't update frequency transition information.\n");
> > 
> > diff --git a/drivers/devfreq/governor_simpleondemand.c
> > b/drivers/devfreq/governor_simpleondemand.c
> > index 3d809f228619..2cbf26bdcfd6 100644
> > --- a/drivers/devfreq/governor_simpleondemand.c
> > +++ b/drivers/devfreq/governor_simpleondemand.c
> > @@ -25,7 +25,7 @@ static int devfreq_simple_ondemand_func(struct devfreq
> > *df,
> >  	unsigned int dfso_downdifferential = DFSO_DOWNDIFFERENCTIAL;
> >  	struct devfreq_simple_ondemand_data *data = df->data;
> > 
> > -	err = devfreq_update_stats(df);
> > +	err = devfreq_update_status(df);
> >  	if (err)
> >  		return err;
> > 
> > diff --git a/drivers/devfreq/tegra30-devfreq.c
> > b/drivers/devfreq/tegra30-devfreq.c
> > index a6ba75f4106d..536273a811fe 100644
> > --- a/drivers/devfreq/tegra30-devfreq.c
> > +++ b/drivers/devfreq/tegra30-devfreq.c
> > @@ -526,7 +526,7 @@ static int tegra_governor_get_target(struct
> > devfreq *devfreq,
> >  	unsigned int i;
> >  	int err;
> > 
> > -	err = devfreq_update_stats(devfreq);
> > +	err = devfreq_update_status(devfreq);
> >  	if (err)
> >  		return err;
