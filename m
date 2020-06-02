Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE001EB281
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jun 2020 02:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgFBAC7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 1 Jun 2020 20:02:59 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27656 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726472AbgFBACz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 1 Jun 2020 20:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591056173;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WEgguSwsSBQsO87++CE0y1rNffa4jp9PI1ZebsV4DLs=;
        b=fbfiDVLzF3ugPR+moWhJgiAxuMHL7loRpI3aocYTJk8Qgkc6VpqbbfBnMi1HmnO25FsXUd
        cloUBUVMwb61L4hVSGLCoGtc+/HFX02bTgLO2AlJ4Gjud72uC7xS4tJ5Q1HFB6q7GTyzOS
        6X7j1xq6n9Mpti5VtIux013jpzOA/Eo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-x32CfxQ6PWKLJP1fj2mf4w-1; Mon, 01 Jun 2020 20:02:39 -0400
X-MC-Unique: x32CfxQ6PWKLJP1fj2mf4w-1
Received: by mail-qk1-f200.google.com with SMTP id v6so9763866qkd.9
        for <linux-tegra@vger.kernel.org>; Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=WEgguSwsSBQsO87++CE0y1rNffa4jp9PI1ZebsV4DLs=;
        b=CSy6XSLaq1h3T3x2ilQTq3LnpQmDII8f07LtFp18FlFhtNhYyOW79V0oMWwA8/ijL3
         v96lfdUpavuwNLb4jLDabXmkQu80anOWdP3bXHIZ/roB3sY+erwhn9UWpaH7bb7uum9n
         FlsDCq6+VKKri7viPXptE7kn2ESyPwwP/BBY9bbaKFnMJZyhXoYjmeUzf1RfBQnjDacW
         kph70TzDeCkFSGG4RDrDZ9bTOcwjNG/AJNVHr6xzrjc7imvQxnMYDBM3wwuEyTHAOyKg
         kloASsR4I1k+gj5QeqtRcHneVxzOIChVAWDZ/54GgkoF1YsKXu2kD0A1vhob3E/9wk9U
         kwxg==
X-Gm-Message-State: AOAM530df9HBC8As3KqIT0Kk+wdyBxUaYc2F30Z0yrp/aAKtsoze2Bsx
        tTH6sbfAiuIwFTAaBpmHShjQVsTUOgtLUqY+AR7XYRbztxuWwmEBfaTp/+UVEZ8+DLJO+nwefbU
        /cG1IXe4RZfyRE/hNYZmCbt8=
X-Received: by 2002:ac8:724c:: with SMTP id l12mr23746266qtp.259.1591056159436;
        Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRFkXYMc6X8G+o56RMfYFp5n8699HmlGFcYOLIr9n0Jz/P369Z9v//wIL4kQ8Ioy89XjW8QQ==
X-Received: by 2002:ac8:724c:: with SMTP id l12mr23746213qtp.259.1591056159140;
        Mon, 01 Jun 2020 17:02:39 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id t13sm852903qtc.77.2020.06.01.17.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:02:37 -0700 (PDT)
Date:   Mon, 1 Jun 2020 17:02:36 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Lu Baolu <baolu.lu@linux.intel.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200602000236.j4m3jvluzdhjngdc@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Mail-Followup-To: Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue Jun 02 20, Lu Baolu wrote:
>Hi Jerry,
>
>On 6/1/20 6:42 PM, Jerry Snitselaar wrote:
>>>
>>>Hi Joerg,
>>>
>>>With this patchset, I have an epyc system where if I boot with
>>>iommu=nopt and force a dump I will see some io page faults for a nic
>>>on the system. The vmcore is harvested and the system reboots. I
>>>haven't reproduced it on other systems yet, but without the patchset I
>>>don't see the io page faults during the kdump.
>>>
>>>Regards,
>>>Jerry
>>
>>I just hit an issue on a separate intel based system (kdump iommu=nopt),
>>where it panics in during intel_iommu_attach_device, in is_aux_domain,
>>due to device_domain_info being DEFER_DEVICE_DOMAIN_INFO. That doesn't
>>get set to a valid address until the domain_add_dev_info call.
>>
>>Is it as simple as the following?
>
>I guess you won't hit this issue if you use iommu/next branch of Joerg's
>tree. We've changed to use a generic helper to retrieve the valid per
>device iommu data or NULL (if there's no).
>
>Best regards,
>baolu
>

Yeah, that will solve the panic. 

>>
>>diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>>index 29d3940847d3..f1bbeed46a4c 100644
>>--- a/drivers/iommu/intel-iommu.c
>>+++ b/drivers/iommu/intel-iommu.c
>>@@ -5053,8 +5053,8 @@ is_aux_domain(struct device *dev, struct 
>>iommu_domain *domain)
>>  {
>>         struct device_domain_info *info = dev->archdata.iommu;
>>
>>-       return info && info->auxd_enabled &&
>>-                       domain->type == IOMMU_DOMAIN_UNMANAGED;
>>+       return info && info != DEFER_DEVICE_DOMAIN_INFO &&
>>+               info->auxd_enabled && domain->type == 
>>IOMMU_DOMAIN_UNMANAGED;
>>  }
>>
>>  static void auxiliary_link_device(struct dmar_domain *domain,
>>
>>
>>Regards,
>>Jerry
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu

