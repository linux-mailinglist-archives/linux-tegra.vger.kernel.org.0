Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739CB3B939E
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Jul 2021 16:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhGAPCK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Jul 2021 11:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46475 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233023AbhGAPCK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Jul 2021 11:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625151579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IVh85kthu0SpW7UY6smgM11I1yNN5lgiNNeNgndC7x4=;
        b=FnbVaaEUtTxLffeLXdycmyQ0IMLiUFqROzWEVmzdb8ZThmSsN05G/3SIStX9pBi4kQx5FE
        HbXlB6U82rD/wnlpmqZ5yzou7K232drvaT0gGQP4M9R1avcz5nskClvW9UVWRDSQPTxbWp
        m9ZWft0A+JLRUQBHPqB7wD1YGwsk5G4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-AoqJI8qwPySVWh8RYldEVA-1; Thu, 01 Jul 2021 10:59:38 -0400
X-MC-Unique: AoqJI8qwPySVWh8RYldEVA-1
Received: by mail-wr1-f69.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso2669515wrh.12
        for <linux-tegra@vger.kernel.org>; Thu, 01 Jul 2021 07:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IVh85kthu0SpW7UY6smgM11I1yNN5lgiNNeNgndC7x4=;
        b=eVCVdDmNRNlRCkr8EEERBXiVhSyCSpTbEGaOu8MQV4ijRb3DuS5Hzw3GTwperoz9Jd
         cOfg/I8Cxe94g2VvTvDBccbgSnV3KV5/pAobWFZF+GYKJv+D25z0tzzXkev6Z3/+C1LB
         DHsmc40VX13P+6oVXOZ33jH9cjrH1sl8g4BqhEGxqqHpCFuWxr0UYnxwM30Y/oin8ZmZ
         1F3pY2u6oNgNqSRkcymWf25fK57Q6DjJCX3pN+PgTO0DUd63i9h0CTxMSLJKN47zPOsO
         JCWyQ2OYdybfI3UJM9b34ZV0tGZk8pw7TYJoyRlzJLiEG4MAWuJzXUfqHV1bLH6oUIdI
         CfYA==
X-Gm-Message-State: AOAM5323NYo+Z3xCrn0vPhGwBFmJ4OYJHSAWJDyb4WbLLROHPsRwlxMu
        9MuPLYe/gsQwPNKAIH+j0o5V+wWaBFdKxBtzzRcJPl8tikWe6Esob/o8ZRzp2lDCYbkOtFwFNfP
        nNRynJJhDb6bN0aZXfkB9EgYDk2OvOWHxCihb+mmWs1pIN5Xs5+FAYDAyeotVRsN/VvNkLW5DOQ
        ==
X-Received: by 2002:a7b:c39a:: with SMTP id s26mr123465wmj.115.1625151577108;
        Thu, 01 Jul 2021 07:59:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeHU3WCUYY7UnaCN/G0uYLtwdgKJ2wXf9QG99tZjlIEUdpQJOc/y9rZPsTlaSCWiCikljylg==
X-Received: by 2002:a7b:c39a:: with SMTP id s26mr123429wmj.115.1625151576888;
        Thu, 01 Jul 2021 07:59:36 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id n19sm277863wms.4.2021.07.01.07.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 07:59:36 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: rockchip: Avoid accessing PCIe registers with
 clocks gated
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20210701135949.GA51123@bjorn-Precision-5520>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <747df123-0aa0-7cb7-9fb3-f13c849894e5@redhat.com>
Date:   Thu, 1 Jul 2021 16:59:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701135949.GA51123@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/1/21 3:59 PM, Bjorn Helgaas wrote:

[snip]

>> The IRQ handler is not called when unregistered, but it is called
>> when another handler for the shared IRQ is unregistered. In this
>> particular driver, both a "pcie-sys" and "pcie-client" handlers are
>> registered, then an error leads to "pcie-sys" being unregistered and
>> the handler for "pcie-client" being called.
> 
> Is this really true?  I think that would mean CONFIG_DEBUG_SHIRQ would
> not find this kind of bug unless we actually registered two or more
> handlers for the shared IRQ, but it's still a bug even only one
> handler is registered.
> 
> Looking at __free_irq() [1], my impression is that "action" is what
> we're removing and action->handler() is the IRQ handler we call when
> CONFIG_DEBUG_SHIRQ, so it doesn't look like it's calling the remaining
> handlers after removing one of them.
> 

Oh, you are completely right. I wrongly assumed that it was for the other
registered IRQ handlers but reading the source is clearly how you say it.

I now wonder why when debugging this I saw that the "pcie-client" handler
was called when "pcie-sys" was unregistered...

But anyways, you are correct and I'm OK with the text you shared.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

