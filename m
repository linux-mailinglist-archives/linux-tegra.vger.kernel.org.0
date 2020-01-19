Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6947E141D45
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jan 2020 11:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgASKOg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jan 2020 05:14:36 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11454 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgASKOg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jan 2020 05:14:36 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e242bfd0000>; Sun, 19 Jan 2020 02:14:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 19 Jan 2020 02:14:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 19 Jan 2020 02:14:35 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jan
 2020 10:14:35 +0000
Received: from [10.40.101.167] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jan
 2020 10:14:33 +0000
Subject: Re: [PATCH V6 07/27] PCI: tegra: Advertise PCIe Advanced Error
 Reporting (AER) capability
To:     Nicolas Chauvet <kwizart@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, <vidyas@nvidia.com>,
        <linux-tegra@vger.kernel.org>
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-8-mmaddireddy@nvidia.com>
 <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A@mail.gmail.com>
X-Nvconfidentiality: public
From:   Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <7739c4e7-d604-a23f-7469-08fbdafb8537@nvidia.com>
Date:   Sun, 19 Jan 2020 15:43:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CABr+WTkoj1zk6RRdPvb2wd9HgBJEbPJR=dtY4f+V1gFrEb671A@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579428862; bh=Bf5GUpsrRqKYXuxQUY1oHfuD7AGnak0gFujh8ktGM64=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=i7rg8BrrrxrIyDXo+xV6NhxktN5elKvcGmNg9m+YaIkyhErn8Sh/x7gim2gEhVL5J
         Jj3fOsxZYa5LX2tRwRoyKOrWH5OD0XgAUvbcV+sPc8T40fsaTQaVhcyNrclvJw63bi
         2VXJR6ZoVtoIWkzWyp9wiljqALR8vnJtZKh4wD1c06qqXyQER0a3CRmI9yldLKeRQa
         Ze2giao99FhOIY1/9W41qaVOsPOBXA9Uh8wSQBC7YcnADrlMSC8p27MISIs5ThfedU
         I6WY9SRPrzUYPRZXTyLrh7/SbeC9JNNF1Hxlvp8cpq79AiszsadN6fJJz921mfuKxW
         YZu2no1TzJrrw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 16-Jan-20 3:43 AM, Nicolas Chauvet wrote:
> External email: Use caution opening links or attachments
>
>
> Le mar. 18 juin 2019 =C3=A0 20:02, Manikanta Maddireddy
> <mmaddireddy@nvidia.com> a =C3=A9crit :
>> Default root port setting hides AER capability. This patch enables the
>> advertisement of AER capability by root port.
> Hello,
>
> For your information, I've reported an issue on kernel.org that is
> related to AER in pcie with the ethernet NIC on jetson-tk1
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206217
>
> I hope someone can shred some lights on this.
>
> --
> -
>
> Nicolas (kwizart)

Hi Nicolas,

This patch enables error reporting capability, it shouldn't have caused
"NETDEV WATCHDOG" error. Let us follow up on the issue in kernel.org.

Thanks,
Manikanta

