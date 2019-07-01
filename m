Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C7147E3B
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 11:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfFQJXf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 05:23:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45449 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfFQJXf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 05:23:35 -0400
Received: by mail-pf1-f195.google.com with SMTP id r1so5336612pfq.12;
        Mon, 17 Jun 2019 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mm/MzCVqKcyrtAkNiFo5ey/RdkAUyCycunAmsvAE86I=;
        b=kCqpL+mIstO+C5j0tCc3sH0FHwAOHw+NR+PmwQqYcD/O8eRi/hcNgJgZMocXXj0jyM
         q8B4rhn6mD6hW4j6it6A/fOOnyNiWPxBMr+owe/khCBpiCjANJh5CedTHlvW4bbxoRXY
         igLkmnBoZcaf0P3DAF16DkVO89yEcJ1g1LNQeHExuI1BsGSm9EANDLNQKUf7rxeRlphO
         72SaPh+M53xabikhB6FBA6ZkYCO9a2/WCgK06Wykl4Sk9XQm0WoEYPtaNkxm6NQJjcuB
         oVrp5Kw2rKDbgoXRM2HemZK7hA3vcL28RxLuRf8e2A+klc9T80jA58jZbasY/F4wts5G
         II8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mm/MzCVqKcyrtAkNiFo5ey/RdkAUyCycunAmsvAE86I=;
        b=uQDL5ktFSG8aECgc4hTkM3+a5Jz/gLnyat3h1RoBpFfBX/y63+hOV0ugZPR7Uvzjm3
         9ryeCufofydPX6Cx8uJpEXgM8IahdHHHmzB/JXzPHu/EDPnLtg7gPYwcQheskT/zpJOC
         q0pD4b3NUA8Uxtq2V2WWn96Wgj/xS+4KlMgj3Gp6JQBncxXOja/wBEMirSlptjkvA1ui
         mV5t/ijjk/+n2YaybOmBNClr0fk00iYZDD0IEmiqxc7kczvLw9UzH3c5g4sOBMdUeBxn
         DCxrdLQ9DqfKXQSwdmQKdPGkSLAUadPiuyFyL9IYwo2LCAsnBingkt1iPt3nbBP1C4pp
         qstg==
X-Gm-Message-State: APjAAAVkKH6vYiUHsD6zhVAl0yEbVJigb7Btwu+PIjWutQdyImBiwdHx
        vrvo1+hLs5nb1gapstb3H/QNLrl9/HufBQ==
X-Google-Smtp-Source: APXvYqzgXDqKW2zMewLh1l3CLftdcu5SiOFPeP0IvqDt5vQFl3nXFvEOLqar0ByJ8P3aWym4RTwO/g==
X-Received: by 2002:a63:570c:: with SMTP id l12mr48974700pgb.252.1560763414394;
        Mon, 17 Jun 2019 02:23:34 -0700 (PDT)
Received: from ubuntu ([104.192.108.10])
        by smtp.gmail.com with ESMTPSA id p7sm21369214pfp.131.2019.06.17.02.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:23:33 -0700 (PDT)
Date:   Mon, 17 Jun 2019 02:23:28 -0700
From:   Gen Zhang <blackgod016574@gmail.com>
To:     jassisinghbrar@gmail.com
Cc:     thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] tegra-hsp: fix a missing-check bug in
 tegra_hsp_doorbell_create()
Message-ID: <20190617092328.GA3764@ubuntu>
References: <20190530011920.GA6490@zhanggen-UX430UQ>
 <20190608161144.GA4090@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608161144.GA4090@zhanggen-UX430UQ>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jun 09, 2019 at 12:11:44AM +0800, Gen Zhang wrote:
> On Thu, May 30, 2019 at 09:19:20AM +0800, Gen Zhang wrote:
> > In tegra_hsp_doorbell_create(), 'db->name' is allocated by 
> > devm_kstrdup_const(). It returns NULL when fails. So 'db->name' should
> > be checked.
> > 
> > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > ---
> > diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> > index 11fc9fd..b613c46 100644
> > --- a/drivers/mailbox/tegra-hsp.c
> > +++ b/drivers/mailbox/tegra-hsp.c
> > @@ -292,6 +292,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, const char *name,
> >  	db->channel.hsp = hsp;
> >  
> >  	db->name = devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> > +	if (!db->name)
> > +		return ERR_PTR(-ENOMEM);
> >  	db->master = master;
> >  	db->index = index;
> >  
> > ---
> Can anyone look into this patch? It's acked by Thierry Reding 
> <treding@nvidia.com>.
> 
> Thanks
> Gen
Could anyone look into this patch? It's not updated for about 20 days.
And I am really on a deadline to get this patch applied.

Thanks
Gen
